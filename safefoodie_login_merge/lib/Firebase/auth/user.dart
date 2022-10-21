import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class User {
  final String id;
  final String email;
  final bool isVerified;
  const User({
    required this.id,
    required this.email,
    required this.isVerified,
  });

  //factory constructor that is initialize the user
  //with the verification with firebase

  factory User.fromFirebase(User user) =>
      User(id: user.id, email: user.email, isVerified: user.isVerified);
}
