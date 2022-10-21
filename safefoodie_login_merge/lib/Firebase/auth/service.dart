import 'package:safefoodie_login_merge/Firebase/auth/firebase_provider.dart';
import 'package:safefoodie_login_merge/Firebase/auth/provider.dart';
import 'package:safefoodie_login_merge/Firebase/auth/user.dart';

class Service implements Provider {
  final Provider provider;
  const Service(this.provider);

  factory Service.firebase() => Service(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialized();

  @override
  Future<void> sendPasswordReset({required String toEmail}) =>
      provider.sendPasswordReset(toEmail: toEmail);

  @override
  Future<void> initialized() {
    // TODO: implement initialized
    throw UnimplementedError();
  }
}
