import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Must Import .Dart inorder to build the widgets
import 'LoginPage.dart';
import 'Rest_Password_page.dart';
import 'signup.dart';
import 'Mainpage.dart';
///////////////////////////////////////////////////

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      // Inital First Page so that LoginPage would load first
      initialRoute: 'LoginScreen',
      home: LoginScreen(),
      routes: {
        // When navigating to the "homeScreen" route, build the HomeScreen widget.
        'LoginScreen': (context) => LoginScreen(),
        // When navigating to the "SignupScreen" route, build the SignupScreen widget.
        'SignupScreen': (context) => SignupScreen(),
        // When navigating to the "ResetPasswordScreen" route, build the ResetPasswordScreen widget.
        'ResetPasswordScreen': (context) => ResetPasswordScreen(),
        // When navigating to the "Mainpage" route, build the Mainpage widget.
        'Mainpage': (context) => Mainpage(),
      },
    );
  }
}
