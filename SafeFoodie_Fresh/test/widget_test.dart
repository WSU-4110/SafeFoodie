import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: unused_import
import 'package:safefoodie_fresh/screens/homepage/home.dart';

void main() {
  testWidgets('BottomNavigationBar callback test', (WidgetTester tester) async {
    late int mutatedIndex;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
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
            onTap: (int index) {
              mutatedIndex = index;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Alarm'));

    expect(mutatedIndex, 1);
  });

  testWidgets('BottomNavigationBar button test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
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
    final RenderBox box = tester.renderObject(find.byType(BottomNavigationBar));
    expect(box.size.height, kBottomNavigationBarHeight);
    expect(find.text('AC'), findsOneWidget);
    expect(find.text('Alarm'), findsOneWidget);
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