// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Tips();
  }
}

//======================================
//Start of body
class _Tips extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    final tipContent = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: Center(
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              //ainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
//======================================
//Tip Tiles
              children: <Widget>[
                Container(
                  // First tip
                  color: const Color.fromARGB(216, 230, 182, 53),
                  height: 170.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: RichText(
                      overflow: TextOverflow.clip, // Controls visual overflow
                      //textAlign: TextAlign
                      //.end, // Controls how the text should be aligned horizontally
                      textDirection:
                          TextDirection.ltr, // Control the text direction
                      softWrap:
                          true, // Whether the text should break at soft line breaks
                      maxLines:
                          8, // Maximum number of lines for the text to span
                      textScaleFactor:
                          .7, // The number of font pixels for each logical pixel
                      text: const TextSpan(
                        text: 'How to store food to last longer  \n',
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                            //bullet points
                            text:
                                '\u2022 Store milk at the back of the fridge to minimize spoilage. \n'
                                '\u2022 Freeze or refridgerate cold perishables immediately! There is around a 2 hour period between purchase and storage before perishables can start going bad.\n'
                                '\u2022 Do not store onions and potatoes near each other. They start each others rotting process.\n'
                                '\u2022 Let cooked food cool all the way before storage.\n',
                            style: TextStyle(fontSize: 18.5), //bullet text
                          ),
                        ],
                      )),
                ),

                //tip 2
                Container(
                  // Second tip
                  color: const Color.fromARGB(255, 38, 90, 28),
                  height: 170.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: RichText(
                      overflow: TextOverflow.clip, // Controls visual overflow
                      textDirection:
                          TextDirection.ltr, // Control the text direction
                      softWrap:
                          true, // Whether the text should break at soft line breaks
                      maxLines:
                          8, // Maximum number of lines for the text to span
                      textScaleFactor:
                          .7, // The number of font pixels for each logical pixel
                      text: const TextSpan(
                        text: 'Check before you buy \n ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            //bullet points
                            text: '\u2022   Always check the expiry date! \n'
                                '\u2022   Make sure fruits and veggies do not have bruises.\n'
                                '\u2022   Crack open that egg carton and check that no eggs are broken!\n'
                                '\u2022   Check for severe dents and broken seals on non-perishables.\n',
                            style: TextStyle(fontSize: 18.5), //bullet text
                          ),
                        ],
                      )),
                ),
                //tip 3
                Container(
                  // First tip
                  color: const Color.fromARGB(216, 230, 182, 53),
                  height: 170.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: RichText(
                      overflow: TextOverflow.clip, // Controls visual overflow
                      textDirection:
                          TextDirection.ltr, // Control the text direction
                      softWrap:
                          true, // Whether the text should break at soft line breaks
                      maxLines:
                          8, // Maximum number of lines for the text to span
                      textScaleFactor:
                          .7, // The number of font pixels for each logical pixel
                      text: const TextSpan(
                        text: 'Truth About Expiry \n ',
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          //bullet points
                          TextSpan(
                            text:
                                '\u2022   Sugar never expires if stored properly in a dry, cool place.\n'
                                '\u2022   Dried pasta can last close to a year after the expiration date.\n'
                                '\u2022   Low-acid canned foods (veggies, soups, tuna) can be stored up to 5 years from purchase date.\n'
                                '\u2022   High-acid canned foods (tomatos, pickles, brines) can be stored up to 1.5 years.\n',
                            style: TextStyle(fontSize: 18.5), //bullet text
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ));
        }),
      ),
    );
//======================================
//Initialize body
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
//======================================
//Bottom nav bar
      body: Center(child: tipContent),
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
