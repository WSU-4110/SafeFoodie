import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safefoodie_fresh/screens/home/list.dart';
import 'package:test/test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/cupertino.dart';


void main() {

  //Testing for list creation
  testWidgets('List Creation Test', (WidgetTester tester) async {
    await tester.pumpWidget(const ListPage());
    await tester.enterText(find.byType(TextField), 'testing');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('testing'), findsOneWidget);
  });

  //Testing for Add Item to list
  testWidgets('Adding Item to List Test', (WidgetTester tester)async{
    await tester.pumpWidget(const ListPage());
    await tester.
  })
}
