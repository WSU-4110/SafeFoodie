import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//database routes
import 'package:firebase_core/firebase_core.dart';
import 'services/auth.dart';
import 'services/firebaseuser.dart';
import 'screens/authenticate/wrapper.dart';

//All page routes
import 'package:safefoodie_fresh/screens/home/account.dart';
import 'package:safefoodie_fresh/screens/home/create_new.dart';
import 'package:safefoodie_fresh/screens/home/tipsPage.dart';
import 'package:safefoodie_fresh/screens/add_items.dart';
import 'package:safefoodie_fresh/screens/newlist.dart';
import 'package:safefoodie_fresh/screens/viewItems.dart';
import 'package:safefoodie_fresh/screens/pushnotif.dart';
import 'package:safefoodie_fresh/screens/ListHistory.dart';
import 'package:safefoodie_fresh/screens/home/map.dart';
import 'package:safefoodie_fresh/screens/home/search_page.dart';
import 'screens/authenticate/reset_password.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          theme: ThemeData(                      //Theme date for entire App
            primarySwatch: Colors.green,
            scaffoldBackgroundColor:
                const Color.fromARGB(166, 72, 168, 75), //color of background
            brightness: Brightness.light,
            primaryColor: const Color.fromARGB(166, 72, 168, 75),
            buttonTheme: ButtonThemeData(
              buttonColor: const Color.fromARGB(166, 72, 168, 75),
              textTheme: ButtonTextTheme.primary,
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(secondary: Colors.white),
            ),
            fontFamily: 'Typography',
            textTheme: const TextTheme(
              subtitle1: TextStyle(color: Colors.black),
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
          ),
          //Initial routes
          initialRoute: 'Login',
          home: const Wrapper(),
          routes: {
            'Account': (context) => const Account(),
            'Searchpage': (context) => const GFG(),
            'MapSample': (context) => const MapSample(),
            'CreateNew': (context) => const CreateNew(),
            'NewList': (context) => const NewList(),
            'AddtoList': (context) => const GList(),
            'TipsPage': (context) => const Tips(),
            'PushNotif': (context) => const PushNotif(),
            'RestPassword': (context) => const RestPassword(),
            'ViewList': (context) => const AddtoList(),
            'ViewHistory': (context) => const ListHistory(),
          }),
    );
  }
}
