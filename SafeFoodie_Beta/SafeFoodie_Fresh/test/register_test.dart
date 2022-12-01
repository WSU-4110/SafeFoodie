import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import "package:safefoodie_fresh/screens/authenticate/register.dart";

void main() {
  group('register page: ', () {

    //Test 1
    testWidgets('email field should validate only when criteria is met', (WidgetTester testEmail) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? fieldValue;

    final Widget testwidget = MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(),
          child: Center(
            child: Material(
              child: Form(
                key: formKey,
                child: TextFormField(
                  onSaved: (String? value) { fieldValue = value; },
                  autofocus: false,
                  validator: (value) {
                    if (value != null) {
                      if (value.contains('@') && value.endsWith('.com')) {
                        return null;
                      }
                      return 'Enter a Valid Email Address';
                    }
                    },
                ),
              ),
            ),
          ),

      ),
    );

    await testEmail.pumpWidget(testwidget);

    final EditableTextState emailFieldTrue = testEmail.state<EditableTextState>(find.byType(EditableText));
    emailFieldTrue.updateEditingValue(const TextEditingValue(text: 'spappTest@gmail.com', composing: TextRange(start: 2, end: 5)));
    expect(emailFieldTrue.currentTextEditingValue.composing, const TextRange(start: 2, end: 5));

    formKey.currentState!.save();
    expect(fieldValue, 'spappTest@gmail.com');
    expect(formKey.currentState!.validate(), isTrue);

    final EditableTextState emailFieldFalse = testEmail.state<EditableTextState>(find.byType(EditableText));
    emailFieldFalse.updateEditingValue(const TextEditingValue(text: 'spappTest', composing: TextRange(start: 2, end: 5)));
    expect(emailFieldFalse.currentTextEditingValue.composing, const TextRange(start: 2, end: 5));

    formKey.currentState!.save();
    expect(fieldValue, 'spappTest');
    expect(formKey.currentState!.validate(), isFalse);
  });

  //Test 2
    testWidgets('password field should validate only when criteria is met', (WidgetTester testPW) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? fieldValue;

    final Widget testwidget = MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(),
          child: Center(
            child: Material(
              child: Form(
                key: formKey,
                child: TextFormField(
                  onSaved: (String? value) { fieldValue = value; },
                  autofocus: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    if (value.trim().length < 8) {
                      return 'Password must be at least 8 characters in length';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
      ),
    );

    await testPW.pumpWidget(testwidget);
 
    final EditableTextState emailFieldTrue = testPW.state<EditableTextState>(find.byType(EditableText));
    emailFieldTrue.updateEditingValue(const TextEditingValue(text: 'Test12345'));

    formKey.currentState!.save();
    expect(fieldValue, 'Test12345');
    expect(formKey.currentState!.validate(), isTrue);

    final EditableTextState emailFieldFalse = testPW.state<EditableTextState>(find.byType(EditableText));
    emailFieldFalse.updateEditingValue(const TextEditingValue(text: 'test'));

    formKey.currentState!.save();
    expect(fieldValue, 'test');
    expect(formKey.currentState!.validate(), isFalse);
    
  });

//Test 3
   testWidgets('when go back button is clicked, user should be sent back to home page', (WidgetTester testNav) async {
    var goBack = false;

     final Widget widget = MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(),
          child: Center(
            child: Material(
              child:  TextButton(
                onPressed: () {
                  goBack = true;
                },
                child: const Text('Go back',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline))
            ),
          ),
        ),
      ),
    );
    
    await testNav.pumpWidget(widget);

    //click the button in question
    await testNav.tap(find.byType(TextButton));

    //if button is clicked, goBack should be true
    expect(goBack, true);
  });

  //Test 4
  testWidgets('fields will reset', (WidgetTester tester) async {
    final GlobalKey<FormState> formState = GlobalKey<FormState>();
    String? errorText(String? value) => '$value/error';

    Widget builder() {
      return MaterialApp(
        theme: ThemeData(),
        home: MediaQuery(
          data: const MediaQueryData(),
            child: Center(
              child: Form(
                key: formState,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Material(
                  child: TextFormField(
                    initialValue: 'testing',
                    validator: errorText,
                  ),
                ),
              ),
            ),
        ),
      );
    }

    await tester.pumpWidget(builder());

    //no error thrown
    expect(find.text(errorText('testing')!), findsNothing);

    //will throw error
    await tester.enterText(find.byType(TextFormField), 'userInfo');
    await tester.pumpAndSettle();
    await tester.pump();
    expect(find.text(errorText('userInfo')!), findsOneWidget);

    //reset form which will get rid of the error
    formState.currentState!.reset();
    await tester.pump();
    expect(find.text(errorText('userInfo')!), findsNothing);
  });

  //Test 5
  testWidgets('validates even before text boxes have input', (WidgetTester tester) async {
    late FormFieldState<String> formFieldState;

    String? errorText(String? value) => '$value/error';

    Widget builder() {
      return MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(),
            child: Center(
              child: Material(
                child: FormField<String>(
                  initialValue: 'nothing',
                  autovalidateMode: AutovalidateMode.always,
                  builder: (FormFieldState<String> state) {
                    formFieldState = state;
                    return Container();
                  },
                  validator: errorText,
                ),
              ),
            ),
        ),
      );
    }

    await tester.pumpWidget(builder());
    expect(formFieldState.hasError, isTrue);
  });

  //Test 6
  testWidgets('password field will be obscured', (WidgetTester testObscure) async {
      bool _obscureText = true;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Widget testwidget = MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(),
          child: Center(
            child: Material(
              child: Form(
                key: formKey,
                child: TextFormField(
                  autofocus: false,
                  obscureText: _obscureText,
                   decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Password',
                    suffixIcon: IconButton(
                      icon:
                          Icon(_obscureText ? Icons.visibility : Icons.visibility_off, 
                          color: Color.fromARGB(216, 230, 182, 53),),
                      onPressed: () {
                          //Allows for password view
                          _obscureText = !_obscureText;
              },
            ),
           )
                ),
              ),
            ),
          ),
      ),
    );

    await testObscure.pumpWidget(testwidget);

    expect(_obscureText, true);
  });
  });

}