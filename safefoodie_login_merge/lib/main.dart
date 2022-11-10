import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:safefoodie_login_merge/views/route_names.dart';
import 'package:safefoodie_login_merge/views/routes.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

// Must Import .Dart inorder to build the widgets
/*import 'LoginPage.dart';
import 'Rest_Password_page.dart';
import 'signup.dart';
import 'Mainpage.dart';
import 'GoogleMap.dart';
import 'lists.dart';
import 'Search.dart';
import 'Account.dart';*/
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/login',
      onGenerateRoute: RouterNav.generateRoute,
      
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().white, //sets default text to white
      ),
      // Inital First Page so that LoginPage would load first
    );
  }
}
