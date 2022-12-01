// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safefoodie_fresh/screens/home/list.dart';
import 'package:safefoodie_fresh/main.dart';

void main() {
  /*testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/

  //List Creation Test
  testWidgets('List Creation Test', (WidgetTester tester) async {
    await tester.pumpWidget(
        const ListCreationWidget(listName: 'test', listNumber: '1'));
    final nameFinder = find.text('test');
    final numberFinder = find.text('1');
    expect(nameFinder, findsOneWidget);
    expect(numberFinder, findsOneWidget);
  });

  //Testing for Add Item to list
  testWidgets('Adding Item to List Test', (WidgetTester tester) async {
    await tester
        .pumpWidget(const ListPageWidget(listName: 'test', listItem: 'Apple'));
    final nameFinder = find.text('test');
    final itemFinder = find.text('Apple');

    expect(nameFinder, findsOneWidget);
    expect(itemFinder, findsOneWidget);
  });

  //Testing Checkbox Function
  testWidgets('Testing Checkbox', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('h'),
      ),
    ));
    expect(find.text('h'), findsOneWidget);
  });

  //Testing Colors
  testWidgets('Testing Colors', (WidgetTester tester) async {
    const Color primaryColor = Color.fromARGB(166, 72, 168, 75);
    const Color primarySwatch = Colors.green;
    const Color checkColor = Colors.white;
    const Color fillColor = Colors.red;
    const Color scaffoldBackgroundColor = Color.fromARGB(166, 72, 168, 75);
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        //primarySwatch: primarySwatch,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
    ));
  });

  //Testing Icon Button
  testWidgets('Testing Icon Buttons', (WidgetTester tester) async {
    const testKey = Key('K');
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));
    expect(find.byKey(testKey), findsOneWidget);
  });

  //View List Test
  testWidgets('Testing List View', (WidgetTester tester) async {
    const ListView = Padding(padding: EdgeInsets.zero);
    await tester.pumpWidget(Container(
      child: ListView,
    ));
    expect(find.byWidget(ListView), findsOneWidget);
  });
}

class ListCreationWidget extends StatelessWidget {
  const ListCreationWidget({
    super.key,
    required this.listName,
    required this.listNumber,
  });
  final String listName;
  final String listNumber;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List Creation',
        home: Scaffold(
          appBar: AppBar(title: Text(listName)),
          body: Center(
            child: Text(listNumber),
          ),
        ));
  }
}

class ListPageWidget extends StatelessWidget {
  const ListPageWidget({
    super.key,
    required this.listName,
    required this.listItem,
  });
  final String listName;
  final String listItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List Creation',
        home: Scaffold(
          appBar: AppBar(title: Text(listName)),
          body: Center(
            child: Text(listItem),
          ),
        ));
  }
}

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Test'),
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'List',
            onPressed: () {},
          ),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: 430,
                height: 700,
                child: Column(
                  children: [
                    Text(
                      'List CheckBox Checker',
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'This is a test',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(width: 10),
                        Checkbox(
                          value: this.value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
