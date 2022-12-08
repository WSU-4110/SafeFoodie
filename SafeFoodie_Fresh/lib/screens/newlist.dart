// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safefoodie_fresh/models/cloud_storage.dart';
import 'package:safefoodie_fresh/screens/add_to_list.dart';

void main() {
  runApp(const NewList());
}

class NewList extends StatefulWidget {
  const NewList({Key? key}) : super(key: key);

  @override
  State<NewList> createState() => _NewList();
}

//String docID = Record.fromSnapshot(snapshot).reference.toString();

class _NewList extends State<NewList> {
  final db = FirebaseFirestore.instance.collection('userInfo');
  //Adding list to Firestore database
  Future addList(String listTitle) async {
    await db.doc('F3qaDYAfGPKZPgbuj5nZ').update({
      'listTitle': listTitle,
    });
  }

  List<String> litems = [];
  String listName = "empty";
  final TextEditingController eCtrl = TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new list"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: eCtrl,
            onSubmitted: (text) {
              litems.add(text);
              listName = text;
              eCtrl.clear();
              setState(() {
                addList(text);
              });
            },
          ),
          ElevatedButton(
            child: const Text('Add'),
            onPressed: () {
              litems.add(listName);
              setState(() {});
            },
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: litems.length,
                  // ignore: non_constant_identifier_names
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return Text(litems[Index]);
                  }))
        ],
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
              icon:
                  const Icon(Icons.align_horizontal_left, color: Colors.green),
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
              icon: const Icon(Icons.account_circle_outlined,
                  color: Colors.green),
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
