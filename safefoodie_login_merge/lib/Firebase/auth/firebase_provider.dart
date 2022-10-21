import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:firebase_core/firebase_core.dart';
import 'package:safefoodie_login_merge/Firebase/firebase_options.dart';
import 'package:safefoodie_login_merge/Firebase/auth/user.dart';
import 'package:safefoodie_login_merge/Firebase/auth/provider.dart';
import 'package:safefoodie_login_merge/Firebase/auth/auth_exceptions.dart';

//Methods from the FirebaseAuth
class FirebaseAuthProvider implements Provider {
  //Utilizing the default no arg constructors
  //Directed Firebase to create user method so it returns a user
  //And we want to return an auth user.
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
      //Firebase authenticaiton exception by throwing the exceptions that we wrote
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-passowrd') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email already in use') {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == 'invalid email') {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

//Directed firebase logIn return a user
  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
      //FirebaseAuth exception with our own defined exception
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> initialized() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<void> sendPasswordReset({required String toEmail}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: toEmail);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'firebase_auth/invalid email':
          throw InvalidEmailAuthException();

        case 'firebase_auth/user not found':
          throw UserNotFoundAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }
}
