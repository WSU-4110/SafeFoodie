import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/cupertino.dart';
import 'Mainpage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().white, //sets default text to white
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
                title: Text('Use System Theme'),
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
            title: Text('Section 2'),
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
            ],
          ),
        ],
      ),
    );
  }
}
