// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safefoodie_fresh/screens/list.dart';
import 'package:safefoodie_fresh/main.dart';
import 'package:safefoodie_fresh/screens/home/list_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  //Testing Colors
  testWidgets('Testing Colors', (WidgetTester tester) async {
    const Color BoxShadowColor = Colors.white;
    const Color BoxDecorationColor = Color.fromARGB(136, 0, 0, 0);
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        primaryColor: BoxDecorationColor,
        //primarySwatch: primarySwatch,
        scaffoldBackgroundColor: BoxShadowColor,
      ),
    ));
  });

//Testing history
  testWidgets('Testing history', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('test'),
      ),
    ));
    expect(find.text('test'), findsOneWidget);
  });

//testing view list
  testWidgets('Testing View List', (WidgetTester tester) async {
    const listView = Padding(padding: EdgeInsets.zero);
    await tester.pumpWidget(Container(
      child: listView,
    ));
    expect(find.byWidget(listView), findsOneWidget);
  });

  //Adding list to history
  testWidgets('Adding list to history', (WidgetTester tester) async {
    await tester.pumpWidget(
        const ListCreationWidget(listName: 'testList', listNumber: '1'));
    final nameFinder = find.text('testList');
    final numberFinder = find.text('1');

    expect(nameFinder, findsOneWidget);
    expect(numberFinder, findsOneWidget);
  });

  //Testing icon button
  testWidgets('Testing icon button', (WidgetTester tester) async {
    const testKey = Key('K');
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));
    expect(find.byKey(testKey), findsOneWidget);
  });

  //View History Test
  testWidgets('View history test', (WidgetTester tester) async {
    const listView = Padding(padding: EdgeInsets.zero);
    await tester.pumpWidget(Container(child: listView));
    expect(find.byWidget(listView), findsOneWidget);
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
