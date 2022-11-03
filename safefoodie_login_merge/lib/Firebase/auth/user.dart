import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  final bool isVerified;
  const AuthUser({
    required this.id,
    required this.email,
    required this.isVerified,
  });

  //factory constructor that is initialize the user
  //with the verification with firebase

  factory AuthUser.fromFirebase(User user) => AuthUser(
      id: user.uid, email: user.email!, isVerified: user.emailVerified);
}
