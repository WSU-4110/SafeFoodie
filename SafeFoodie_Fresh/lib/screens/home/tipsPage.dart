import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  const Tips({Key? key}) : super(key: key);
 
  @override
  State<StatefulWidget> createState() {
    return _Tips();
  }
}

class _Tips extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    final tipContent = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
        child: Center(
        child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                //ainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    // First tip
                    color: const Color.fromARGB(255, 193, 219, 188),
                    height: 120.0,
                    alignment: Alignment.center,
                    child: RichText(
                          overflow: TextOverflow.clip, // Controls visual overflow
                          textAlign: TextAlign.end, // Controls how the text should be aligned horizontally
                          textDirection: TextDirection.rtl, // Control the text direction
                          softWrap: true, // Whether the text should break at soft line breaks
                          maxLines: 8, // Maximum number of lines for the text to span
                          textScaleFactor: 1, // The number of font pixels for each logical pixel
                          text: TextSpan(
                            text: 'How to store food to last longer: ', style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                //bullet points
                                  text: '\u2022   Store milk at the back of the fridge to minimize spoilage.''\u2022   Freeze or refridgerate cold perishables immediately! There is around a 2 hour period between purchase and storage before perishables can start going bad.' '\u2022   Do not store onions and potatoes near each other. They start each others rotting process.''\u2022   Let cooked food cool all the way before storage.', style: TextStyle(fontSize: 30), //bullet text                                  
                                  ),                                  
                            ],
                            
                          )            
                        ),
                    ),
                    //tip 2
                  Container(
                    // Second tip
                    color: const Color.fromARGB(255, 193, 219, 188),
                    height: 120.0,
                    alignment: Alignment.center,
                    child: RichText(
                          overflow: TextOverflow.clip, // Controls visual overflow
                          textAlign: TextAlign.end, // Controls how the text should be aligned horizontally
                          textDirection: TextDirection.rtl, // Control the text direction
                          softWrap: true, // Whether the text should break at soft line breaks
                          maxLines: 8, // Maximum number of lines for the text to span
                          textScaleFactor: 1, // The number of font pixels for each logical pixel
                          text: TextSpan(
                            text: 'Check before you buy: ', style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                //bullet points
                                  text: '\u2022   Always check the expiry date! ''\u2022   Make sure fruits and veggies do not have bruises.' '\u2022   Crack open that egg carton and check that no eggs are broken!''\u2022   Check for severe dents and broken seals on non-perishables.', style: TextStyle(fontSize: 30), //bullet text                                  
                                  ),                                  
                            ],
                            
                          )            
                        ),
                  ),
                  //tip 3
                  Container(
                    // First tip
                    color: const Color.fromARGB(255, 193, 219, 188),
                    height: 120.0,
                    alignment: Alignment.center,
                    child: RichText(
                          overflow: TextOverflow.clip, // Controls visual overflow
                          textAlign: TextAlign.end, // Controls how the text should be aligned horizontally
                          textDirection: TextDirection.rtl, // Control the text direction
                          softWrap: true, // Whether the text should break at soft line breaks
                          maxLines: 8, // Maximum number of lines for the text to span
                          textScaleFactor: 1, // The number of font pixels for each logical pixel
                          text: TextSpan(
                            text: 'Truth About Expiry: ', style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              //bullet points
                              TextSpan(
                                  text: '\u2022   Sugar never expires if stored properly in a dry, cool place.''\u2022   Dried pasta can last close to a year after the expiration date.' '\u2022   Low-acid canned foods (veggies, soups, tuna) can be stored up to 5 years from purchase date.''\u2022   High-acid canned foods (tomatos, pickles, brines) can be stored up to 1.5 years.', style: TextStyle(fontSize: 30), //bullet text                                  
                                  ),                                  
                            ],
                            
                          )            
                        ),
                  ),                  
                ],
              ),
            )   
          );
         }),
            ),
          );
      return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to SafeFoodie'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
       body: Center(child: tipContent),
//Center action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                    Navigator.pushNamed(context, 'CreateNew');
        },
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