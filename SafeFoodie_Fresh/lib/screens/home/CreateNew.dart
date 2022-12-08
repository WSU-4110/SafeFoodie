// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const CreateNew());
}

class CreateNew extends StatefulWidget {
  const CreateNew({Key? key}) : super(key: key);

  @override
  State<CreateNew> createState() => _CreateNew();
}

class _CreateNew extends State<CreateNew> {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Page"),
        ),
body: Container(
        padding: const EdgeInsets.symmetric(vertical: 247.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem1("Add to existing list", Icons.low_priority_sharp),
            makeDashboardItem2("Create new list", Icons.library_add_sharp),
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

    Card makeDashboardItem1(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'AddtoList');
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

      Card makeDashboardItem2(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: InkWell(
            onTap: () {
                //Navigator.pushNamed(context, 'NewList');
                //Just changing the routing for the new create list function
                Navigator.pushedNamed(context, 'ListApp');
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
}
