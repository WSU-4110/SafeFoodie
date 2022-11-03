import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:safefoodie_login_merge/views/forgot_pw.dart';
import 'package:safefoodie_login_merge/views/route_names.dart';
import 'package:safefoodie_login_merge/views/route_names.dart';
import 'package:safefoodie_login_merge/views/routes.dart';
import 'package:safefoodie_login_merge/views/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: homepageRoute,
      //onGenerateRoute: Route.;
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('en', ' '), // American English
        const Locale('es', ' '), // Spanish
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().white, //sets default text to white
      ),
      home: HomeScreen(),
    );
  }
}

//======================================
//Description: Used in my original code for user and pass input

//class MyStatefulWidget extends StatefulWidget {
// const MyStatefulWidget({Key? key}) : super(key: key);

// @override
// State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
//}

//class _MyStatefulWidgetState extends State<MyStatefulWidget> {
// TextEditingController nameController = TextEditingController();
// TextEditingController passwordController = TextEditingController();
//class HomeScreen extends StatelessWidget {

//======================================
// Initialize homescreen features
class HomeScreen extends StatelessWidget {
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
            Navigator.pushNamed(context, loginRoute);
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
                Navigator.pushNamed(context, homepageRoute);
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
                Navigator.pushNamed(context, registerRoute);
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ])),
    );
  }

//======================================================================================
//NAV FUNCTIONS
//======================================================================================
/*//Nav function for signup
  void _TosignupScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignupPage()));
  }

//Nav function for password reset page
  void _ToresetScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ResetPage()));
  }

//Nav function for main page
  void _ToMainScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainPage()));
  }

*/
//Nav function for search lists page

//Nav function for create list/add item search page

//Nav function for settings

}

//======================================================================================
//======================================================================================
//Firebase Authorization
final FirebaseAuth _auth = FirebaseAuth.instance;

//======================================================================================
//PAGE CLASS INITIALIZATION
//======================================================================================
//Signup class
/*class SignupPage extends StatefulWidget {
  //signup
  @override
  _SignupPageState createState() => _SignupPageState();
}

//Reset Class
class ResetPage extends StatefulWidget {
  //forgot pass
  @override
  _ResetPageState createState() => _ResetPageState();
}

//main page
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}*/

//Search lists page

//Add item/create page

//settings page

//======================================================================================
//EMAIL SIGNUP FUNCTION
//======================================================================================
class _SignupPageState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _sucess;
  late String _userEmail;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _sucess = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _sucess = false;
      });
    }
  }

//======================================================================================
//SIGNUP PAGE START
//======================================================================================
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: const Text('Sign up')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: Text("Sign up now!", style: TextStyle(fontSize: 40)),
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
                    controller: _emailController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    height: 40,
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
                            _register();
                          },
                          child: Center(
                              child: Text('SIGNUP',
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
}

//======================================================================================
//RESET PAGE START
//======================================================================================

class _ResetPageState extends State<ResetPage> {
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
}

//======================================================================================
//HOME PAGE START
//======================================================================================

class _MainPageState extends State<HomeScreen> {
//=======================================
//Button Widgets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        SizedBox(
          height: 200,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: const Icon(Icons.align_horizontal_left),
                color: Colors.white, //view all lists
                onPressed: () {
//_ToViewListsScreen(context);
                }),
            IconButton(
                icon: const Icon(Icons.search),
                color: Colors.white, //search lists
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.add_circle),
                color: Colors.white, //Create list, add item
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.white, //settings
                onPressed: () {}),
          ],
        ))

//======================================
      ])),
    );
  }
}

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
