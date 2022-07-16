import 'package:blagorodni/extentions/error_handler.dart';
import 'package:blagorodni/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.userRepository}) : super(LoginInitial());

  final UserRepository userRepository;

  Future<void> signIn(String email, String password) async {
    await userRepository.signIn(email, password).withErrorHandler(this);
    emit(LoginSuccessState());
  }
}
