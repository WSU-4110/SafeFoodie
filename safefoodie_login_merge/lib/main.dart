import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'Password.dart';
import 'signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().white, //sets default text to white
      ),
      initialRoute: 'LoginPage',
      home: LoginScreen(),
      routes: {
        // When navigating to the "homeScreen" route, build the HomeScreen widget.
        'LoginScreen': (context) => LoginScreen(),
        // When navigating to the "secondScreen" route, build the SecondScreen widget.
        'SignupScreen': (context) => SignupScreen(),
        'PasswordScreen': (context) => PasswordScreen(),
      },
    );
  }
}
