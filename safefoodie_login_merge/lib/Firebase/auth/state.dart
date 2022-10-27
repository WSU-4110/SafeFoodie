import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:safefoodie_login_merge/Firebase/auth/user.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class State {
  final bool loading;
  final String? loadingText;
  const State({
    required this.loading,
    this.loadingText = 'Please wait',
  });
}

//state that something is not initialized
class StateUninitialized extends State {
  const StateUninitialized({required bool loading}) : super(loading: loading);
}

//Registration state
class StateRegistering extends State {
  final Exception? exception;
  const StateRegistering({
    required this.exception,
    required bool loading,
  }) : super(loading: loading);
}

//Reset Password state
class StateResetPassword extends State {
  final Exception? exception;
  final bool sentEmail;
  const StateResetPassword({
    required this.exception,
    required this.sentEmail,
    required bool loading,
  }) : super(loading: loading);
}

//Logged in state
class StateLoggedIn extends State {
  final AuthUser user;
  const StateLoggedIn({
    required this.user,
    required bool loading,
  }) : super(loading: loading);
}

//email verification state
class StateVerification extends State {
  const StateVerification({required bool loading}) : super(loading: loading);
}

//Logged out state
class StateLoggedOut extends State with EquatableMixin {
  final Exception? exception;
  const StateLoggedOut({
    required this.exception,
    required bool loading,
    String? loadingText,
  }) : super(loading: loading, loadingText: loadingText);

  @override
  List<Object> get props => [exception, loading];
}
