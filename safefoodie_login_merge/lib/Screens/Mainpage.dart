import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserSignup/LoginPage.dart';


//page after login
//=======================================
//Routing
class Mainpage extends StatefulWidget {
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
//=======================================
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().white, //sets default text to white
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

//=================================================================
//Page Start
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  body: Center(
    child: Text(
      'Main page', //filler text for now
    ),
  ),
//Center action button
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add_circle),
    backgroundColor: Colors.green, //sets button color
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //inidcates pronounced button position
  //Bottom Navbar
  bottomNavigationBar: BottomAppBar(
    shape: CircularNotchedRectangle(), //navbar reactiveness to center button
    notchMargin: 5, //number of elements on bar
    child: Row(
      //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      //View lists button
        IconButton(
          icon: Icon(
            Icons.align_horizontal_left, color: Colors.green
          ),
          onPressed: () {

          },
        ),
       //Search item button 
        IconButton(
          icon: Icon(
            Icons.search, color: Colors.green
          ),
          onPressed: () {

          },
        ),
       //Route back to home page 
        IconButton(
          icon: Icon(
            Icons.home, color: Colors.green
          ),
          onPressed: () {

          },
        ),
       //Account page button 
        IconButton(
          icon: Icon(
            Icons.account_circle_outlined, color: Colors.green
          ),
          onPressed: () {

          },
        ),
      ],
    ),
  ),
);
}}