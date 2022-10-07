import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SafeFoodie';

  //======================================
  //flutter project title
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().white, //sets default text to white
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}
//======================================

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
//======================================
//title header
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'SafeFoodie',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),

            Icon(
              Icons.bakery_dining_rounded,
              color: Color.fromARGB(216, 230, 182, 53),
            ),
//======================================
//Sign in header
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                )),
//======================================
//interactive username and password bars
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'User Name',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Password',
                ),
              ),
            ),

//======================================
//Forgot password prompt
            TextButton(
              onPressed: () {
//forgot password screen
              },
              child: const Text(
                'Forgot Password?',
              ),
            ),
//======================================
//Login button
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )),
//======================================
//Sign up prompt
            Row(
              children: <Widget>[
                const Text('No account?'),
                TextButton(
                  child: const Text(
                    'Sign up now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  onPressed: () {},
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
//======================================
