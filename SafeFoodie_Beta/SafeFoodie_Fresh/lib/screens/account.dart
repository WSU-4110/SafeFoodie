import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          // each block is a section of settings
          SettingsSection(
            title: Text('General'),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                value: Text('English'),
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: Text('Notifications'),
                leading: Icon(Icons.phone_android),
                initialValue: setSwitch,
                onToggle: (value) {
                  setState(() {
                    setSwitch = value;
                  });
                },
              ),
            ],
          ),

          SettingsSection(
            title: Text('Account'),
            tiles: [
              SettingsTile(
                title: Text('Security'),
                value: Text('Fingerprint'),
                leading: Icon(Icons.lock),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: Text('Use fingerprint'),
                leading: Icon(Icons.fingerprint),
                initialValue: fingerIsSwitched,
                onToggle: (value2) {
                  setState(() {
                    fingerIsSwitched = value2;
                  });
                },
              ),
              SettingsTile(
                title: Text('Email'),
                value: Text('User Email Placeholder'),
                leading: Icon(Icons.email),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text('Phone Number'),
                value: Text('Users Phone Number'),
                leading: Icon(Icons.phone),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
