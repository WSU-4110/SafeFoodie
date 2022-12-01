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
  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Create new list"),
        ),
//Center action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'CreateNew');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green, //sets button color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //inidcates pronounced button position
      //Bottom Navbar
      bottomNavigationBar: BottomAppBar(
        shape:
            CircularNotchedRectangle(), //navbar reactiveness to center button
        notchMargin: 5, //number of elements on bar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //View lists button
            IconButton(
              icon: Icon(Icons.align_horizontal_left, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'PageList');
              },
            ),
            //Search item button
            IconButton(
              icon: Icon(Icons.search, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'Searchpage');
              },
            ),
            //Route back to home page
            IconButton(
              icon: Icon(Icons.location_pin, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, 'MapSample');
              },
            ),
            //Account page button
            IconButton(
              icon: Icon(Icons.account_circle_outlined, color: Colors.green),
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
