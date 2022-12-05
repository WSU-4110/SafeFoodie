import 'package:safefoodie_fresh/models/loginuser.dart';
import 'package:safefoodie_fresh/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  final AuthService _auth = new AuthService();
//=========================================
//Auth parameters
  bool _obscureText = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //=========================================
  //Page begin
  @override
  Widget build(BuildContext context) {
//=========================================
//email function
    final emailField = TextFormField(
        controller: _email,
        autofocus: false,
        validator: (value) {
//Parameters for valid entry
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Enter a Valid Email Address';
          }
        },
//email bubble
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(134, 218, 216, 216), width: 2.5),
          ),
          border: const OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Email',
        ));
//=========================================
//Password function
    final passwordField = TextFormField(
        obscureText: _obscureText,
        controller: _password,
        autofocus: false,
        validator: (value) {
//Password parameters
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if (value.trim().length < 8) {
            return 'Password must be at least 8 characters in length';
          }
          // Return null if the entered password is valid
          return null;
        },
//Password bubble
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(134, 218, 216, 216), width: 2.5),
          ),
          border: const OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Color.fromARGB(216, 230, 182, 53),
            ),
            onPressed: () {
              setState(() {
                //Allows for password view
                _obscureText = !_obscureText;
              });
            },
          ),
        ));
//=========================================
// Back button
    final Goback = TextButton(
        onPressed: () {
          widget.toggleView!();
        },
        child: const Text('Go back',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline)));
//=========================================
//Register button
    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        color: Colors.green,
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            dynamic result = await _auth.registerEmailPassword(
                LoginUser(email: _email.text, password: _password.text));
            if (result.uid == null) {
              //null means unsuccessfull authentication
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(result.code),
                    );
                  });
            }
          }
        },
        child: Text(
          "Sign up",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );
//=========================================
//Physical page begin
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
// Page header
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: Text("Sign up now!",
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                  ),
//Call all classes
                  const SizedBox(height: 45.0),
                  emailField,
                  const SizedBox(height: 25.0),
                  passwordField,
                  const SizedBox(height: 25.0),
                  registerButton,
                  const SizedBox(height: 15.0),
                  Goback,
                  const SizedBox(height: 35.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
