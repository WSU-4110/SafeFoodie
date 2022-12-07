// ignore_for_file: unused_import

import 'package:safefoodie_fresh/services/auth.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {
//=========================================
//dashboard tiles 
 Card tipsTile(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: InkWell(
            onTap: () async {
              //await _auth.signOut();
              Navigator.pushNamed(context, 'TipsPage');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: const Color.fromARGB(216, 230, 182, 53),
                )),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
//========================================= 
//settings tile
   Card settingsTile(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: InkWell(
            onTap: () {
                Navigator.pushNamed(context, 'Account');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: const Color.fromARGB(216, 230, 182, 53),
                )),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
//========================================= 
//search tile
Card searchTile(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: InkWell(
            onTap: () {
                Navigator.pushNamed(context, 'Searchpage');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: const Color.fromARGB(216, 230, 182, 53),
                )),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
//========================================= 
//List history
Card historyTile(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: InkWell(
            onTap: () {
                Navigator.pushNamed(context, 'Searchpage');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: const Color.fromARGB(216, 230, 182, 53),
                )),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
//========================================= 
//intializes main app 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to SafeFoodie'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
       body: Container(
        padding: const EdgeInsets.symmetric(vertical: 136.0, horizontal: 2.0),
        //grid tiles
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            tipsTile("Tips", Icons.lightbulb_outline ),
            settingsTile("Settings", Icons.settings_applications_outlined),
            searchTile("Search", Icons.search_outlined),
            historyTile("List history", Icons.my_library_books_rounded)
          ],
        ),
      ),
//Center action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                    Navigator.pushNamed(context, 'CreateNew');
        },
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add),
        backgroundColor: Colors.green, //sets button color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //inidcates pronounced button position
      //Bottom Navbar
      bottomNavigationBar: BottomAppBar(
        shape:
            const CircularNotchedRectangle(), //navbar reactiveness to center button
        notchMargin: 5, //number of elements on bar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //View lists button
            IconButton(
              icon: const Icon(Icons.align_horizontal_left, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'PageList');
              },
            ),
            //Search item button
            IconButton(
              icon: const Icon(Icons.search, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'Searchpage');
              },
            ),
            //Route back to home page
            IconButton(
              icon: const Icon(Icons.location_pin, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'MapSample');
              },
            ),
            //Account page button
            IconButton(
              icon: const Icon(Icons.account_circle_outlined, color: Colors.green),
              onPressed: () {
                //Settings navigator
                Navigator.pushNamed(context, 'Account');
              },
            ),
          ],
        ),
      ),
    );
  }
}
