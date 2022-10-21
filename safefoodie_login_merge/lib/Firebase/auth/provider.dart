import 'package:safefoodie_login_merge/Firebase/auth/user.dart';

abstract class Provider {
  User? get currentUser;

  Future<void> initialized();
  Future<User> logIn({
    required String email,
    required String password,
  });

  Future<User> createUser({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
