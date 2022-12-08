// ignore_for_file: file_names

import 'package:flutter/material.dart';
 
void main() {
  runApp(const Search());
}
 
class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);
 
  // This is the root widget
  // of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const GFG(),
    );
  }
}

// This is the widget that will be shown
// as the homepage of your application.
class GFG extends StatefulWidget {
  const GFG({super.key});

 // const GFG({Key? key}) : super(key: key);
 
  @override
  State<GFG> createState() => _GFGState();
}
 
class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SafeFoodie",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),

//Bottom navbar
  floatingActionButton: FloatingActionButton(
    onPressed: () {
                Navigator.pushNamed(context, 'CreateNew');
    },
    // ignore: sort_child_properties_last
    child: const Icon(Icons.add),
    backgroundColor: Colors.green, //sets button color
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //inidcates pronounced button position
  //Bottom Navbar
  bottomNavigationBar: BottomAppBar(
    shape: const CircularNotchedRectangle(), //navbar reactiveness to center button
    notchMargin: 5, //number of elements on bar
    child: Row(
      //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      //View lists button
        IconButton(
          icon: const Icon(
            Icons.align_horizontal_left, color: Colors.green
          ),
          onPressed: () {
 Navigator.pushNamed(context, 'PageList');
          },
        ),
       //Search item button 
        IconButton(
          icon: const Icon(
            Icons.search, color: Colors.green
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'Searchpage');
          },
        ),
       //Route back to home page 
        IconButton(
          icon: const Icon(
            Icons.location_pin, color: Colors.green
          ),
          onPressed: () {
 Navigator.pushNamed(context, 'MapSample');
          },
        ),
       //Account page button 
        IconButton(
          icon: const Icon(
            Icons.account_circle_outlined, color: Colors.green
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'Account');
          },
        ),
      ],
    ),
  ),



    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  // Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Strawberries"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }
 
  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
 
  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
 
  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}


