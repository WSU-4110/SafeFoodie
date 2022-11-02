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
                Navigator.pushNamed(context, 'SignupScreen');
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
//======================================================================================
//Firebase Authorization

//======================================================================================
//VIEW LISTS PAGE START
//======================================================================================
class _ViewListsState extends State<ViewListsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: const Text('Account recovery')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child:
                        Text("Password reset", style: TextStyle(fontSize: 40)),
                  )
                ],
              ),
            ),
//======================================
//Text field
            Container(
              padding: EdgeInsets.only(top: 35, left: 20, right: 30),
              child: Column(
                children: <Widget>[
                  TextField(
                    // controller: _emailController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Enter account email',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
//======================================
// sign up button
                  Container(
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7,
                      child: GestureDetector(
                          onTap: () async {
                            //      _register();
                          },
                          child: Center(
                              child: Text('SEND RESET EMAIL',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
//======================================
//back button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Go Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

// Need to import these after Viewlist page is Created //

//======================================================================================
//NAV FUNCTIONS
//======================================================================================
//Nav function for view lists page
  void _ToViewListsScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ViewListsPage()));
  }
}

//======================================================================================
//PAGE CLASS INITIALIZATION
//======================================================================================
//View lists page
class ViewListsPage extends StatefulWidget {
  @override
  _ViewListsState createState() => _ViewListsState();
}
