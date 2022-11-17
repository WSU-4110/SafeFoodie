import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Account',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75),
             primaryColor: Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().black, //sets default text to black
      ),
      home: Account(),
    ),
  );
}

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool setSwitch = false;
  bool fingerIsSwitched = false;

//=========================================
//Account page start
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account managment'),
        backgroundColor: Colors.green
      ),
//Settings pads
      body: SettingsList(
        sections: [
// each block is a section of settings
// General settings
          SettingsSection(
            title: Text('General',
            style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',decoration: TextDecoration.underline)),
            tiles: [
              SettingsTile(
                title: Text('Language',style: TextStyle(color: Colors.green)),
                value: Text('English',style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: Icon(Icons.language, color: Colors.green),
                trailing: Icon(Icons.arrow_forward_ios, color: Color.fromARGB(216, 230, 182, 53)),
                onPressed: (BuildContext context) {
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Language"),
                          content:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text("English"),
                            Text("Spanish"),
                            Text("French"),
                            Text("Arabic"),
                          ]),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            )
                          ],
                        );
                      });                 
                },
              ),
              SettingsTile.switchTile(
                title: Text('Notifications',style: TextStyle(color: Colors.green)),

                leading: Icon(Icons.phone_android, color: Colors.green),
                initialValue: setSwitch,
                onToggle: (value) {
                  setState(() {
                    setSwitch = value;
                  });
                },
              ),
            ],
          ),
//Account settings
          SettingsSection(
            title: Text('Account',
             style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',decoration: TextDecoration.underline)),
            tiles: [
              SettingsTile(
                title: Text('Security',style: TextStyle(color: Colors.green)),
                value: Text('Fingerprint',style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: Icon(Icons.lock, color: Colors.green),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: Text('Use fingerprint',style: TextStyle(color: Colors.green)),
                leading: Icon(Icons.fingerprint, color: Colors.green),
                initialValue: fingerIsSwitched,
                onToggle: (value2) {
                  setState(() {
                    fingerIsSwitched = value2;
                  });
                },
              ),
              SettingsTile(
                title: Text('Email',style: TextStyle(color: Colors.green)),
                value: Text('User Email Placeholder',style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: Icon(Icons.email, color: Colors.green),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text('Phone Number',style: TextStyle(color: Colors.green)),
                value: Text('Users Phone Number',style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: Icon(Icons.phone, color: Colors.green),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
  //=========================================
  //Bottom navbar
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
            Icons.location_pin, color: Colors.green
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