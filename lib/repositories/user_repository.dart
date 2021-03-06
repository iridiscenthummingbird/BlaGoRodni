import 'package:blagorodni/managers/auth_manager.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class UserRepository {
  Future<void> signIn(String email, String password);

  Future<void> signUp(String email, String password);

  Future<void> googleSignIn();

  Future<void> logout();
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

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    sharedPreferenceManager.logout();
  }

  @override
  Future<void> googleSignIn() async {
    final GoogleSignInAccount? result = await GoogleSignIn().signIn();
    final String uid = result?.id ?? '';
    sharedPreferenceManager.setUid(uid);
  }
}
