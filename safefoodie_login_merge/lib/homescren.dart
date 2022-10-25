import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().white, //sets default text to white
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'My lists',
      style: optionStyle,
    ),
    Text(
      'Search Lists',
      style: optionStyle,
    ),
    Text(
      'Filler',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Create List
        },
        label: const Text('Create New List'),
        icon: Icon(Icons.add_circle),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.green, // <-- This works for fixed
        selectedItemColor: Color.fromARGB(216, 230, 182, 53),
        unselectedItemColor: Colors.brown,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.align_horizontal_left),
            label: 'View Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
// Nav function for my lits page
void _ToMyListsScreen(BuildContext context) {
  Navigator.of(context)
// .push(MaterialPageRoute(builder: (context) => MyListsPage()));
}

//nav function for Search Lists page
void _ToSearchListScreen(BuildContext context) {
  Navigator.of(context)
    //  .push(MaterialPageRoute(builder: (context) => SearchListsPage()));
}*/

/*Nav function for settings Page
void _ToSettingsScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SettingsPage()));
}*/
//
//======================================================================
// INITIALIZATION OF PAGE CLASS
//======================================================================

/*class MyListsScreen extends StatefulWidget {
  //signup
  @override
  _MyListsPageState createState() => _MyListsPageState();
}*/

// class SearchListScreen extends StatefulWidget {
  //signup
  //@override
 // _SearchListPageState createState() => _SearchListPageState();
//}

//class SettingsPage extends StatefulWidget {
  //signup
 // @override
 // _SettingsPageState createState() => _SettingsPageState();
//}

/* class _MyListsPageState extends State<MyListsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _sucess;
  late String _userEmail;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _sucess = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _sucess = false;
      });
    }
//  }
*/
//}