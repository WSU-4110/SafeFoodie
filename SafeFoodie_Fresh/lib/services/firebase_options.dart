// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
/// 
/// 
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC39gV20mHg0kTjm-4_-TqJ7DtWqx7CAgc',
    appId: '1:804090316597:web:f4ad8c3e3cc073715d2e7c',
    messagingSenderId: '804090316597',
    projectId: 'safefoodie-fresh',
    authDomain: 'safefoodie-fresh.firebaseapp.com',
    databaseURL: 'https://safefoodie-fresh-default-rtdb.firebaseio.com',
    storageBucket: 'safefoodie-fresh.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1dM3FzbQTST-5Gm-iPECwB0ysjsP1ANc',
    appId: '1:804090316597:android:8ebf92953f7fae0f5d2e7c',
    messagingSenderId: '804090316597',
    projectId: 'safefoodie-fresh',
    databaseURL: 'https://safefoodie-fresh-default-rtdb.firebaseio.com',
    storageBucket: 'safefoodie-fresh.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBplp3Lp6hki987hhag-2O8tsdsdds5PxA',
    appId: '1:804090316597:ios:383d27e0b0e381575d2e7c',
    messagingSenderId: '804090316597',
    projectId: 'safefoodie-fresh',
    databaseURL: 'https://safefoodie-fresh-default-rtdb.firebaseio.com',
    storageBucket: 'safefoodie-fresh.appspot.com',
    iosClientId: '804090316597-jtqtjs8cr0tv6adbe6svehs02a5bk8hi.apps.googleusercontent.com',
    iosBundleId: 'com.example.safefoodieFresh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBplp3Lp6hki987hhag-2O8tsdsdds5PxA',
    appId: '1:804090316597:ios:383d27e0b0e381575d2e7c',
    messagingSenderId: '804090316597',
    projectId: 'safefoodie-fresh',
    databaseURL: 'https://safefoodie-fresh-default-rtdb.firebaseio.com',
    storageBucket: 'safefoodie-fresh.appspot.com',
    iosClientId: '804090316597-jtqtjs8cr0tv6adbe6svehs02a5bk8hi.apps.googleusercontent.com',
    iosBundleId: 'com.example.safefoodieFresh',
  );
}
