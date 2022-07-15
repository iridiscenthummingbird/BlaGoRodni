import 'package:blagorodni/managers/api_manager.dart';
import 'package:blagorodni/managers/model/get_request.dart';
import 'package:blagorodni/utils/json_reader.dart';

abstract class UsersRepository {
  Future<void> loadUsers();
}

class UsersRepositoryImpl extends UsersRepository {
  final ApiManager apiManager;

  UsersRepositoryImpl({required this.apiManager});

  @override
  Future<void> loadUsers() async {
    final dynamic res = await apiManager.callApiRequest(GetRequest('users'));
    final JsonReader reader = JsonReader(res);

    reader.asMap();

    //return User.fromJSON(reader.asMap());
  }
}
