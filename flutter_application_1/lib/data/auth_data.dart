import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDatasource {
  Future<void> register(String email, String pass, String passconfirm);
  Future<void> login(String email, String pass);
}

class AuthenticationRemote extends AuthenticationDatasource {
  @override
  Future<void> login(String email, String pass) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.trim(), password: pass.trim());
  }

  @override
  Future<void> register(String email, String pass, String passconfirm) async {
    if (passconfirm == pass) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: pass.trim());
    }
  }
}
