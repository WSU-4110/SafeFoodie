import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:safefoodie_fresh/screens/account.dart';
import 'package:safefoodie_fresh/screens/home/PageList.dart';
import 'package:safefoodie_fresh/screens/home/CreateNew.dart';
import 'package:safefoodie_fresh/screens/home/tipsPage.dart';
import 'package:safefoodie_fresh/screens/list_creation.dart';
import 'package:safefoodie_fresh/screens/newlist.dart';
import 'package:safefoodie_fresh/screens/add_to_list.dart';
import 'screens/authenticate/RestPassword.dart';



import 'services/auth.dart';
import 'models/FirebaseUser.dart';
import 'screens/wrapper.dart';
// For Routing
import 'package:safefoodie_fresh/screens/home/MapSample.dart';
import 'package:safefoodie_fresh/screens/home/Searchpage.dart';


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
          theme: ThemeData(
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
              subtitle1: TextStyle(color: Colors.white),
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
            // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
          ),
          //Initial route for Settings
          initialRoute: 'Login',
          home: const Wrapper(),
          routes: {
            'Account': (context) => const Account(),
            'Searchpage': (context) => const GFG(),
            'MapSample': (context) => const MapSample(),
            'PageList': (context) => const PageList(),
            'CreateNew': (context) => const CreateNew(),
            'NewList': (context) => const NewList(),
            'AddtoList': (context) => const GList(),
            'TipsPage': (context) => const Tips(),
            'RestPassword': (context) => const RestPassword(),
            'ViewList': (context) => const AddtoList(),
          }),
    );
  }
}
