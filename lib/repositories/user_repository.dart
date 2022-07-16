import 'package:blagorodni/managers/auth_manager.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';

abstract class UserRepository {
  Future<void> signIn(String email, String password);

  Future<void> signUp(String email, String password);
}

class UserRepositoryImpl extends UserRepository {
  final SharedPreferenceManager sharedPreferenceManager;
  final AuthManager authManager;

  UserRepositoryImpl({
    required this.sharedPreferenceManager,
    required this.authManager,
  });

  @override
  Future<void> signIn(String email, String password) async {
    final String uid = await authManager.signIn(email, password);
    sharedPreferenceManager.setUid(uid);
  }

  @override
  Future<void> signUp(String email, String password) async {
    final String uid = await authManager.signUp(email, password);
    sharedPreferenceManager.setUid(uid);
  }
}
