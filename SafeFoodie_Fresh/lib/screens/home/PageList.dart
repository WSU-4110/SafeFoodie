import 'package:flutter/material.dart';

void main() {
  runApp(const PageList());
}

class PageList extends StatefulWidget {
  const PageList({Key? key}) : super(key: key);

  @override
  State<PageList> createState() => _PageList();
}

class _PageList extends State<PageList> {
  List<String> litems = [];
  final TextEditingController eCtrl = TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grocery List"),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
               // onSubmitted:
                (text) {
                  litems.add(text);
                  eCtrl.clear();
                  setState(() {});
                };
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
