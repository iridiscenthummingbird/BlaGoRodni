import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blagorodni/managers/exceptions/app_exceptions.dart';
import 'package:blagorodni/managers/model/api_request.dart';
import 'package:blagorodni/managers/model/delete_request.dart';
import 'package:blagorodni/managers/model/get_request.dart';
import 'package:blagorodni/managers/model/patch_request.dart';
import 'package:blagorodni/managers/model/post_request.dart';
import 'package:blagorodni/managers/model/put_request.dart';
import 'package:blagorodni/utils/json_reader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const Duration _requestTimeout = Duration(seconds: 25);

abstract class ApiManager {
  factory ApiManager() => ApiManagerImpl._singleton;

  Future<dynamic> callApiRequest(ApiRequest request);

  Future<dynamic> retry(ApiRequest request);

  void setUserToken(String token);

  bool checkUserToken();

  Future<JsonReader> loginUser(ApiRequest request);

  Future<JsonReader> signUpUser(ApiRequest request);

  Future<void> logOutUser(ApiRequest request);

  Future<dynamic> refreshToken(ApiRequest request);

  static ApiManager of(BuildContext context) => RepositoryProvider.of(context);
}

Map<String, String> globalHeaders = <String, String>{
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class ApiManagerImpl implements ApiManager {
  String baseUrl = 'https://jsonplaceholder.typicode.com/'; //TODO: set url
  static final ApiManagerImpl _singleton = ApiManagerImpl._internal();
  static bool _isInitialized = false;
  final Map<ApiRequest, int> _networkFailedRequestAttempts = <ApiRequest, int>{};

  factory ApiManagerImpl() {
    return _singleton;
  }

  ApiManagerImpl._internal();

  void init() {
    assert(!_isInitialized);
    _isInitialized = true;
  }

  @override
  Future<dynamic> callApiRequest(ApiRequest request) async {
    assert(_isInitialized);
    try {
      final dynamic result = await _performRequest(request);
      return result;
    } on SocketException catch (e) {
      // Crashlytics.instance.recordError(e, stack);
      final dynamic result = await _handleNetworkError(request, e);
      return result;
    } on TimeoutException catch (e) {
      // Crashlytics.instance.recordError(e, stack);
      final dynamic result = await _handleNetworkError(request, e);
      return result;
    }
  }

  Future<void> initTimeZone() async {}

  Future<dynamic> _performRequest(ApiRequest request) async {
    final Uri url = Uri.parse(baseUrl + request.urlSuffix);
    final Map<String, String> headers = Map<String, String>.of(globalHeaders);
    // if (headers['timezone'] == null) {
    //   final String currentTimeZone =
    //       await FlutterNativeTimezone.getLocalTimezone();
    //   headers['timezone'] = currentTimeZone;
    // }

    Future<Response>? responseFuture;
    switch (request.runtimeType) {
      case GetRequest:
        responseFuture = http.get(url, headers: headers);
        break;

      case PostRequest:
        responseFuture =
            http.post(url, body: request.payload.isNotEmpty ? json.encode(request.payload) : null, headers: headers);
        break;

      case PutRequest:
        responseFuture =
            http.put(url, body: request.payload.isNotEmpty ? json.encode(request.payload) : null, headers: headers);
        break;

      case PatchRequest:
        responseFuture = http.patch(url, body: json.encode(request.payload), headers: headers);
        break;

      case DeleteRequest:
        responseFuture = http.delete(url, headers: headers);
        break;

      default:
        break;
    }

    final Response response = await responseFuture!.timeout(_requestTimeout);

    if (response.body.contains('403 Forbidden')) {
      throw const SocketException('403 Forbidden');
    }

    _networkFailedRequestAttempts.remove(request);

    return checkResponse(response, request);
  }

  Future<dynamic> _handleNetworkError(ApiRequest request, Exception e) async {
    // final info = showNetworkErrorPopup(); //TODO: showNetworkErrorPopup
    // if ((await info?.result) ?? false) {
    //   return callApiRequest(request);
    // }
    throw NoInternetException();
  }

  Future<dynamic> checkResponse(Response response, ApiRequest request) async {
    if (kDebugMode) {
      print('Status code ${response.statusCode} for request ${request.urlSuffix}\nBody : \n ${response.body}');
    }

    final JsonReader jsonReader = JsonReader(json.decode(response.body));

    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 400:
      case 404:
      case 405:
      case 422:
        throw BadRequestException(
          jsonReader['status'].asString(),
          jsonReader['error'].asString(),
          jsonReader['errors'].asMap(),
          jsonReader['message'].asString(),
        );
      case 425:
        throw TooEarlyException(response.statusCode.toString(), jsonReader['error'].asString());
      case 401:
      case 403:
        throw UnauthorisedException(jsonReader['error'].asString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  @override
  Future<dynamic> retry(ApiRequest request) async {
    return Future<dynamic>.delayed(const Duration(seconds: 2), () => callApiRequest(request));
  }

  @override
  void setUserToken(String token) {
    globalHeaders['Authorization'] = 'Bearer $token';
  }

  @override
  bool checkUserToken() {
    return globalHeaders.containsKey('Authorization');
  }

  @override
  Future<JsonReader> loginUser(ApiRequest request) async {
    final dynamic data = await callApiRequest(request);
    final JsonReader json = JsonReader(data);
    final String userToken = json['access_token'].asString();
    setUserToken(userToken);
    return json;
  }

  @override
  Future<JsonReader> signUpUser(ApiRequest request) async {
    final dynamic data = await callApiRequest(request);
    final JsonReader json = JsonReader(data);
    final String userToken = json['access_token'].asString();
    setUserToken(userToken);
    return json;
  }

  @override
  Future<void> logOutUser(ApiRequest request) async {
    await callApiRequest(request);
    globalHeaders.remove('Authorization');
  }

  @override
  Future<dynamic> refreshToken(ApiRequest request) async {
    final dynamic info = await callApiRequest(
      GetRequest('auth/refresh'),
    );

    final json = JsonReader(info);

    final token = json['data']['token'].asString();

    setUserToken(token);

    if (kDebugMode) {
      print('CALLING REFRESH TOKEN');
    }

    return await callApiRequest(request);
  }
}
