import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:safefoodie_fresh/Searchpage.dart';
import 'package:safefoodie_fresh/screens/account.dart';
import 'package:safefoodie_fresh/screens/home/list.dart';

import 'services/auth.dart';
import 'models/FirebaseUser.dart';
import 'screens/wrapper.dart';
import 'package:safefoodie_fresh/screens/home/MapSample.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor:
                Color.fromARGB(166, 72, 168, 75), //color of background
            brightness: Brightness.light,
            primaryColor: Color.fromARGB(166, 72, 168, 75),
            buttonTheme: ButtonThemeData(
              buttonColor: Color.fromARGB(166, 72, 168, 75),
              textTheme: ButtonTextTheme.primary,
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(secondary: Colors.white),
            ),
            fontFamily: 'Typography',
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
            // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
          ),
          //Initial route for Settings
          initialRoute: 'Login',
          home: Wrapper(),
          routes: {
            'Account': (context) => Account(),
            'Searchpage': (context) => GFG(),
            'MapSample': (context) => MapSample(),
            'ListPage': (context) => ListPage(),
         }),
    );
  }
}