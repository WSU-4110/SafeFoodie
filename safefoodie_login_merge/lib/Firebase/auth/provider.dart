import 'package:safefoodie_login_merge/Firebase/auth/user.dart';

abstract class Provider {
  AuthUser? get currentUser; //Either return an AuthUser object or return null

//Call await on all methods that return the future value

  Future<void> initialized();
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
