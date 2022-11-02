import 'package:flutter/material.dart';
import 'package:safefoodie_login_merge/views/route_names.dart';
import 'package:safefoodie_login_merge/views/forgot_pw.dart';
import 'package:safefoodie_login_merge/views/list_view.dart';
import 'package:safefoodie_login_merge/views/login.dart';
import 'package:safefoodie_login_merge/views/signup.dart';
import 'package:safefoodie_login_merge/views/homepage.dart';

class RouterNav {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<MainPage>(builder: (context) => MainPage());

      case loginRoute:
        return MaterialPageRoute<LoginScreen>(
            builder: (context) => LoginScreen());

      case registerRoute:
        return MaterialPageRoute<RegisterView>(
            builder: (context) => RegisterView());

      case forgotPWRoute:
        return MaterialPageRoute<ResetPage>(builder: (context) => ResetPage());

      case homepageRoute:
        return MaterialPageRoute<MainPage>(builder: (context) => MainPage());

      case listRoute:
        return MaterialPageRoute<ListsView>(builder: (context) => ListsView());

      default:
        return MaterialPageRoute<MainPage>(builder: (context) => MainPage());
    }
  }
}
