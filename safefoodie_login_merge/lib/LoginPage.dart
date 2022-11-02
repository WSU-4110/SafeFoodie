import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login page')),
      body: Center(
          child: ListView(children: <Widget>[
//======================================
//title header
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'SafeFoodie',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),

        Icon(
          Icons.bakery_dining_rounded,
          color: Color.fromARGB(216, 230, 182, 53),
        ),

//======================================
//Sign in header
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Sign in',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            )),
//======================================
//interactive username and password bars
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            // controller: nameController,
            decoration: const InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              border: const OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'User Name',
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            obscureText: true,
            //controller: passwordController,
            decoration: const InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              border: const OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Password',
            ),
          ),
        ),
//======================================
//Forgot password prompt
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'ResetPasswordScreen');
          },
          child: const Text(
            'Forgot Password?',
          ),
        ),
//======================================
//Login button
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, 'Mainpage');
                //print(nameController.text);
                //print(passwordController.text);
              },
            )),
//======================================
//Sign up prompt
        Row(
          children: <Widget>[
            const Text('No account?'),
            TextButton(
              child: const Text(
                'Sign up now',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'Map');
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ])),
    );
  }
}
//======================================================================================
