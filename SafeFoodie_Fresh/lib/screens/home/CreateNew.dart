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
        title: Text("Create Page"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem1(
                "Add to existing list", Icons.low_priority_sharp),
            makeDashboardItem2("Create new list", Icons.library_add_sharp),
          ],
        ),
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

  Card makeDashboardItem1(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.green),
          child: new InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'AddtoList');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Color.fromARGB(216, 230, 182, 53),
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItem2(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.green),
          child: new InkWell(
            onTap: () {
              //Navigator.pushNamed(context, 'NewList');
              Navigator.pushNamed(context, 'ListApp');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Color.fromARGB(216, 230, 182, 53),
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
}
