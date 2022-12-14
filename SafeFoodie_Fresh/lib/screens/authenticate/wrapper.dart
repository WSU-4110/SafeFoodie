import 'package:provider/provider.dart';
import 'package:safefoodie_fresh/screens/homepage/home.dart';
import 'package:flutter/material.dart';

import '../../services/firebaseuser.dart';
import 'handler.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    if (user == null) {
      return const Handler();
    } else {
      return const Home();
    }
  }
}
