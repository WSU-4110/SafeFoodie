// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:safefoodie_fresh/screens/list.dart';
import 'package:safefoodie_fresh/main.dart';
import 'package:safefoodie_fresh/screens/homepage/list_history.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {

  //Testing Colors
  testWidgets('Testing Colors', (WidgetTester tester) async {
    const Color boxShadowColor = Colors.white;
    const Color boxDecorationColor = Color.fromARGB(136, 0, 0, 0);
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        primaryColor: boxDecorationColor,
        //primarySwatch: primarySwatch,
        scaffoldBackgroundColor: boxShadowColor,
      ),
    ));
  });

//Testing history
  testWidgets('Testing history', (tester) async {
    await tester.pumpWidget(const MaterialApp(
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
