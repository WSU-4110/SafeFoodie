import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

testWidgets('test tip1', (WidgetTester tester) async {
     final Container tip1 = Container(
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
    );
    expect(tip1, hasOneLineDescription);
    await tester.pumpWidget(Align(
      alignment: Alignment.topLeft,
      child: tip1
    ));
    final RenderBox tip = tester.renderObject(find.byType(Container));
    expect(tip, isNotNull);
    expect(tip, hasOneLineDescription);
    expect(tip.size.height, equals(170.0));
});

  testWidgets('test second tip box', (WidgetTester tester) async {
    final Container tip2 = Container(
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
    );
    expect(tip2, hasOneLineDescription);
    await tester.pumpWidget(Align(
      alignment: Alignment.topLeft,
      child: tip2
    ));
    
    final RenderBox tip = tester.renderObject(find.byType(Container));
    expect(tip, isNotNull);
    expect(tip, hasOneLineDescription);
    expect(tip.size.height, equals(170.0));
  });
  testWidgets(
      'iconTheme color should override itemColor for BottomNavigationBarType.fixed',
      (WidgetTester tester) async {
    const Color primaryColor = Color(0xFF000000);
    const Color unselectedWidgetColor = Color(0xFFD501FF);
    const Color selectedColor = Color(0xFF0004FF);
    const Color unselectedColor = Color(0xFFE5FF00);
    const Color selectedLabelColor = Color(0xFFFF9900);
    const Color unselectedLabelColor = Color(0xFF92F74E);
    const Color selectedIconThemeColor = Color(0xFF1E7723);
    const Color unselectedIconThemeColor = Color(0xFF009688);
    const IconThemeData selectedIconTheme =
        IconThemeData(size: 20, color: selectedIconThemeColor);
    const IconThemeData unselectedIconTheme =
        IconThemeData(size: 18, color: unselectedIconThemeColor);
    const TextStyle selectedTextStyle =
        TextStyle(fontSize: 18.0, color: selectedLabelColor);
    const TextStyle unselectedTextStyle =
        TextStyle(fontSize: 18.0, color: unselectedLabelColor);

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
          unselectedWidgetColor: unselectedWidgetColor,
        ),
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: selectedTextStyle,
            unselectedLabelStyle: unselectedTextStyle,
            selectedIconTheme: selectedIconTheme,
            unselectedIconTheme: unselectedIconTheme,
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'AC',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                label: 'Alarm',
              ),
            ],
          ),
        ),
      ),
    );
  });
  testWidgets('BottomNavigationBar multiple taps test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'AC',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                label: 'Alarm',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Time',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
              ),
            ],
          ),
        ),
      ),
    );

    // We want to make sure that the last label does not get displaced,
    // irrespective of how many taps happen on the first N - 1 labels and how
    // they grow.

    Iterable<RenderBox> actions =
        tester.renderObjectList(find.byType(InkResponse));
    final Offset originalOrigin =
        actions.elementAt(3).localToGlobal(Offset.zero);

    await tester.tap(find.text('AC'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    actions = tester.renderObjectList(find.byType(InkResponse));
    expect(actions.elementAt(3).localToGlobal(Offset.zero),
        equals(originalOrigin));

    await tester.tap(find.text('Alarm'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    actions = tester.renderObjectList(find.byType(InkResponse));
    expect(actions.elementAt(3).localToGlobal(Offset.zero),
        equals(originalOrigin));

    await tester.tap(find.text('Time'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    actions = tester.renderObjectList(find.byType(InkResponse));
    expect(actions.elementAt(3).localToGlobal(Offset.zero),
        equals(originalOrigin));
  });
  testWidgets('BottomNavigationBar iconSize test', (WidgetTester tester) async {
    late double builderIconSize;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 12.0,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                label: 'A',
                icon: Icon(Icons.settings),
              ),
              BottomNavigationBarItem(
                label: 'B',
                icon: Builder(
                  builder: (BuildContext context) {
                    builderIconSize = IconTheme.of(context).size!;
                    return SizedBox(
                      width: builderIconSize,
                      height: builderIconSize,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Icon));
    expect(box.size.width, equals(12.0));
    expect(box.size.height, equals(12.0));
    expect(builderIconSize, 12.0);
  });
  testWidgets(
      'BottomNavigationBar does not grow with textScaleFactor when labels are provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'A',
                icon: Icon(Icons.settings),
              ),
              BottomNavigationBarItem(
                label: 'B',
                icon: Icon(Icons.location_pin),
              ),
            ],
          ),
        ),
      ),
    );

    final RenderBox defaultBox =
        tester.renderObject(find.byType(BottomNavigationBar));
    expect(defaultBox.size.height, equals(kBottomNavigationBarHeight));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'A',
                icon: Icon(Icons.settings),
              ),
              BottomNavigationBarItem(
                label: 'B',
                icon: Icon(Icons.location_pin),
              ),
            ],
          ),
        ),
      ),
    );

    final RenderBox shiftingBox =
        tester.renderObject(find.byType(BottomNavigationBar));
    expect(shiftingBox.size.height, equals(kBottomNavigationBarHeight));

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(textScaleFactor: 2.0),
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: 'A',
                  icon: Icon(Icons.settings),
                ),
                BottomNavigationBarItem(
                  label: 'B',
                  icon: Icon(Icons.location_pin),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(BottomNavigationBar));
    expect(box.size.height, equals(kBottomNavigationBarHeight));
  });

}