import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthManager {
  Future<String> signIn(String email, String password);
}

class AuthManagerImpl implements AuthManager {
  @override
  Future<String> signIn(String email, String password) async {
    UserCredential? credential;

    credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(credential);

    return credential.user?.uid ?? '';
  }
}
