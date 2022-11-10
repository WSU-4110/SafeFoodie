import 'package:safefoodie_fresh/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
//=========================================
//Sign out function   
    final SignOut = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          await _auth.signOut();
        },
        child: Text(
          "Log out",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );
//=========================================
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to SafeFoodie'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(child: SignOut),
//Center action button
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
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
  }
}
