// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import "package:safefoodie_fresh/screens/authenticate/login.dart";

void main() {
  testWidgets('Validator sets the error text only when validate is called',
      (WidgetTester tester) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? errorText(String? value) => '${value ?? ''}/error';

    Widget builder(AutovalidateMode autovalidateMode) {
      return MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Material(
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: TextFormField(
                    validator: errorText,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Start off not autovalidating.
    await tester.pumpWidget(builder(AutovalidateMode.disabled));

    Future<void> checkErrorText(String testValue) async {
      formKey.currentState!.reset();
      await tester.pumpWidget(builder(AutovalidateMode.disabled));
      await tester.enterText(find.byType(TextFormField), testValue);
      await tester.pump();

      // We have to manually validate if we're not autovalidating.
      expect(find.text(errorText(testValue)!), findsNothing);
      formKey.currentState!.validate();
      await tester.pump();
      expect(find.text(errorText(testValue)!), findsOneWidget);

      // Try again with autovalidation. Should validate immediately.
      formKey.currentState!.reset();
      await tester.pumpWidget(builder(AutovalidateMode.always));
      await tester.enterText(find.byType(TextFormField), testValue);
      await tester.pump();

      expect(find.text(errorText(testValue)!), findsOneWidget);
    }

    await checkErrorText('Test');
    await checkErrorText('');
  });

  testWidgets('Multiple TextFormFields communicate',
      (WidgetTester tester) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<FormFieldState<String>> fieldKey =
        GlobalKey<FormFieldState<String>>();
    // Input 2's validator depends on a input 1's value.
    String? errorText(String? input) => '${fieldKey.currentState!.value}/error';

    Widget builder() {
      return MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Material(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        key: fieldKey,
                      ),
                      TextFormField(
                        validator: errorText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(builder());

    Future<void> checkErrorText(String testValue) async {
      await tester.enterText(find.byType(TextFormField).first, testValue);
      await tester.pump();

      // Check for a new Text widget with our error text.
      expect(find.text('$testValue/error'), findsOneWidget);
      return;
    }

    await checkErrorText('Test');
    await checkErrorText('');
  });

  testWidgets('TextField resets to its initial value',
      (WidgetTester tester) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<FormFieldState<String>> inputKey =
        GlobalKey<FormFieldState<String>>();
    final TextEditingController controller =
        TextEditingController(text: 'Plover');

    Widget builder() {
      return MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Material(
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    key: inputKey,
                    controller: controller,
                    // initialValue is 'Plover'
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(builder());
    await tester.showKeyboard(find.byType(TextFormField));
    final EditableTextState editableText =
        tester.state(find.byType(EditableText));

    // overwrite initial value.
    controller.text = 'Xyzzy';
    await tester.idle();
    expect(editableText.widget.controller.text, equals('Xyzzy'));
    expect(inputKey.currentState!.value, equals('Xyzzy'));
    expect(controller.text, equals('Xyzzy'));

    // verify value resets to initialValue on reset.
    formKey.currentState!.reset();
    await tester.idle();
    expect(inputKey.currentState!.value, equals('Plover'));
    expect(editableText.widget.controller.text, equals('Plover'));
    expect(controller.text, equals('Plover'));
  });

  testWidgets('No crash when a TextFormField is removed from the tree',
      (WidgetTester tester) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? fieldValue;

    Widget builder(bool remove) {
      return MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Material(
                child: Form(
                  key: formKey,
                  child: remove
                      ? Container()
                      : TextFormField(
                          autofocus: true,
                          onSaved: (String? value) {
                            fieldValue = value;
                          },
                          validator: (String? value) {
                            return (value == null || value.isEmpty)
                                ? null
                                : 'yes';
                          },
                        ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(builder(false));

    expect(fieldValue, isNull);
    expect(formKey.currentState!.validate(), isTrue);

    await tester.enterText(find.byType(TextFormField), 'Test');
    await tester.pumpWidget(builder(false));

    // Form wasn't saved yet.
    expect(fieldValue, null);
    expect(formKey.currentState!.validate(), isFalse);

    formKey.currentState!.save();

    // Now fieldValue is saved.
    expect(fieldValue, 'Test');
    expect(formKey.currentState!.validate(), isFalse);

    // Now remove the field with an error.
    await tester.pumpWidget(builder(true));

    // Reset the form. Should not crash.
    formKey.currentState!.reset();
    formKey.currentState!.save();
    expect(formKey.currentState!.validate(), isTrue);
  });

  testWidgets('DefaultTextStyle changes propagate to Text',
      (WidgetTester tester) async {
    const Text textWidget = Text('Hello', textDirection: TextDirection.ltr);
    const TextStyle s1 = TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w800,
      height: 123.0,
    );

    await tester.pumpWidget(const DefaultTextStyle(
      style: s1,
      child: textWidget,
    ));

    RichText text = tester.firstWidget(find.byType(RichText));
    expect(text, isNotNull);
    expect(text.text.style, s1);

    await tester.pumpWidget(const DefaultTextStyle(
      style: s1,
      textAlign: TextAlign.justify,
      softWrap: false,
      overflow: TextOverflow.fade,
      maxLines: 3,
      child: textWidget,
    ));

    text = tester.firstWidget(find.byType(RichText));
    expect(text, isNotNull);
    expect(text.text.style, s1);
    expect(text.textAlign, TextAlign.justify);
    expect(text.softWrap, false);
    expect(text.overflow, TextOverflow.fade);
    expect(text.maxLines, 3);
  });

  testWidgets('SizedBox ', (WidgetTester tester) async {
    const SizedBox a = SizedBox();
    expect(a.width, isNull);
    expect(a.height, isNull);

    const SizedBox b = SizedBox(width: 10.0);
    expect(b.width, 10.0);
    expect(b.height, isNull);

    const SizedBox c = SizedBox(width: 10.0, height: 20.0);
    expect(c.width, 10.0);
    expect(c.height, 20.0);

    final SizedBox d = SizedBox.fromSize();
    expect(d.width, isNull);
    expect(d.height, isNull);

    final SizedBox e = SizedBox.fromSize(size: const Size(1.0, 2.0));
    expect(e.width, 1.0);
    expect(e.height, 2.0);

    const SizedBox f = SizedBox.expand();
    expect(f.width, double.infinity);
    expect(f.height, double.infinity);

    const SizedBox g = SizedBox.shrink();
    expect(g.width, 0.0);
    expect(g.height, 0.0);
  });
}
