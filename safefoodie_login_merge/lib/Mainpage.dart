import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';

//page after login

class Mainpage extends StatelessWidget {
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

        // Temp Go back Botton
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
