import 'package:safefoodie_fresh/models/loginuser.dart';
import 'package:safefoodie_fresh/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:safefoodie_fresh/screens/authenticate/RestPassword.dart';

class Login extends StatefulWidget {
  final Function? toggleView;
  const Login({super.key, this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  bool _obscureText = true;

//======================================
//Auth classes
  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
//======================================
//Start of page
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        controller: _email,
        autofocus: false,
//======================================
//Error throw for incompatible email
        validator: (value) {
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Enter a Valid Email Address';
          }
          return null;
        },
//======================================
//Email prompt area
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(134, 218, 216, 216), width: 2.5),
          ),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Email',
        ));
//Parameters for funct
    final passwordField = TextFormField(
        obscureText: _obscureText,
        controller: _password,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if (value.trim().length < 8) {
            return 'Password must be at least 8 characters in length';
          }
          // Return null if the entered password is valid
          return null;
        },
//======================================
//Password type in area
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(134, 218, 216, 216), width: 2.5),
          ),
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(color: Colors.white),
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: const Color.fromARGB(216, 230, 182, 53),
            ),
            onPressed: () {
              setState(() {
                //Allows for password view
                _obscureText = !_obscureText;
              });
            },
          ),
        ));
//======================================
//Signup button
    final signup = TextButton(
        onPressed: () {
          widget.toggleView!();
        },
        child: const Text(
          'No account? Sign up now',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ));
//======================================
//Forgot pw button
    final forgotpw = TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'RestPassword');
        },
        child: const Text('Forgot Password?'));
//======================================
//Temp bypass button
    final tempbypass = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          dynamic result = await _auth.signInAnonymous();

          if (result.uid == null) {
            //null means unsuccessfull authentication
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text('Wrong Password'),
                  );
                });
          }
        },
        child: Text(
          "Temp bypass button",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );
//======================================
//Login button
    final loginEmailPasswordButon = Material(
      elevation: 5.0,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            dynamic result = await _auth.signInEmailPassword(
                LoginUser(email: _email.text, password: _password.text));
            if (result.uid == null) {
              //null means unsuccessfull authentication
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text('Wrong email or password'),
                    );
                  });
            }
          }
        },
        child: const Text(
          "Log in",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login page'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  const Icon(
                    Icons.bakery_dining_rounded,
                    color: Color.fromARGB(216, 230, 182, 53),
                  ),
//======================================
//MAIN BODY
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
//Function calls
                  emailField,
                  const SizedBox(height: 25.0),
                  passwordField,
                  forgotpw,
                  const SizedBox(height: 5.0),
                  loginEmailPasswordButon,
                  const SizedBox(height: 5.0),
                  signup,
                  const SizedBox(height: 15.0),
                  tempbypass,
                  const SizedBox(height: 45.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}