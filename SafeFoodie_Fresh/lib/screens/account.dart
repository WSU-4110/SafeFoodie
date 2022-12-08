// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:safefoodie_fresh/services/auth.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(166, 72, 168, 75),
        primaryColor:
            const Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().black, //sets default text to black
      ),
      home: const Account(),
    ),
  );
}

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final AuthService _auth = AuthService();
  bool setSwitch = false;
  bool fingerIsSwitched = false;

//=========================================
//Account page start
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Account managment'),
          backgroundColor: Colors.green),
//Settings pads
      body: SettingsList(
        sections: [
// each block is a section of settings
// General settings
          SettingsSection(
            title: const Text('General',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    decoration: TextDecoration.underline)),
            tiles: [
              SettingsTile(
                title: const Text('Language',
                    style: TextStyle(color: Colors.green)),
                value: const Text('English',
                    style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: const Icon(Icons.language, color: Colors.green),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color.fromARGB(216, 230, 182, 53)),
                onPressed: (BuildContext context) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Language"),
                          content:
                              // ignore: prefer_const_literals_to_create_immutables
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            const Text("English"),
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
                title: Text('Notifications',
                    style: TextStyle(color: Colors.green)),
                leading: Icon(Icons.phone_android, color: Colors.green),
                initialValue: setSwitch,
                onToggle: (value) {
                  setState(() {
                    setSwitch = value;
                  });
                },
              ),
              SettingsTile(
                title: Text('Notification test page',
                    style: TextStyle(color: Colors.green)),
                value: Text('Notification calibration',
                    style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: Icon(Icons.cloud_circle_rounded, color: Colors.green),
                onPressed: (BuildContext context) {
                  Navigator.pushNamed(context, 'PushNotif');
                },
              ),
            ],
          ),
//Account settings
          SettingsSection(
            title: Text('Account',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    decoration: TextDecoration.underline)),
            tiles: [
              SettingsTile(
                title: Text('Email', style: TextStyle(color: Colors.green)),
                value: Text('User Email Placeholder',
                    style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: Icon(Icons.email, color: Colors.green),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title:
                    Text('Phone Number', style: TextStyle(color: Colors.green)),
                value: Text('Users Phone Number',
                    style: TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                leading: Icon(Icons.phone, color: Colors.green),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                  title: const Text('Logout',
                      style: TextStyle(color: Colors.green)),
                  value: const Text('Logout of account',
                      style:
                          TextStyle(color: Color.fromARGB(216, 230, 182, 53))),
                  leading: const Icon(Icons.waving_hand_outlined,
                      color: Colors.green),
                  trailing: const Icon(Icons.logout_sharp,
                      color: Color.fromARGB(216, 230, 182, 53)),
                  onPressed: (BuildContext context) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Are you sure you want to logout?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Confirm'),
                              onPressed: () async {
                                Navigator.popUntil(
                                    context, ModalRoute.withName("/"));
                                await _auth.signOut();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ],
      ),
      //=========================================
      //Bottom navbar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'CreateNew');
        },
        // ignore: sort_child_properties_last
        child: Icon(Icons.add),
        backgroundColor: Colors.green, //sets button color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //inidcates pronounced button position
      //Bottom Navbar
      bottomNavigationBar: BottomAppBar(
        shape:
            CircularNotchedRectangle(), //navbar reactiveness to center button
        notchMargin: 5, //number of elements on bar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //View lists button
            IconButton(
              icon: Icon(Icons.align_horizontal_left, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'PageList');
              },
            ),
            //Search item button
            IconButton(
              icon: Icon(Icons.search, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'Searchpage');
              },
            ),
            //Route back to home page
            IconButton(
              icon: Icon(Icons.location_pin, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'MapSample');
              },
            ),
            //Account page button
            IconButton(
              icon: Icon(Icons.account_circle_outlined, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'Account');
              },
            ),
          ],
        ),
      ),
    );
  }
}
