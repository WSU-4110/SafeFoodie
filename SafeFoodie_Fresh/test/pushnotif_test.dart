import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:safefoodie_fresh/pushnotif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Find a Text Widget!', (wTester) async {
    await wTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Push the buttons below to create new/clear all notifications'),
      ),
    ));

    expect(find.text('Push the buttons below to create new/clear all notifications'),
        findsOneWidget);
  });

  testWidgets('Find a specific instance!', (wTester) async {
    const childWidget = Padding(padding: EdgeInsets.all(20.0));
    await wTester.pumpWidget(Container(child: childWidget));

    //search for childWidget in tree and prove it only shows up once!
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('MyHomePage has a Title!', (wTester) async {
    await wTester
        .pumpWidget(const MyHomePage(title: 'Get SafeFoodie Push Notifications!'));

    //find the given title!
    final titleFind = find.text('Get SafeFoodie Push Notifications!');

    //prove that it shows up only once!
    expect(titleFind, findsOneWidget);
  });

  testWidgets('NewPushNotif floating button test!',
      (WidgetTester wTester) async {
    await wTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Create New notification',
            child: const Icon(Icons.outgoing_mail),
          ),
        ),
      ),
    );

    await wTester.tap(find.byType(Icon));
    expect(find.byTooltip('Create New notification'), findsOneWidget);
  });

  testWidgets('CancelPushNotif floating button test!',
      (WidgetTester wTester) async {
    await wTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Cancel all notifications',
            child: const Icon(Icons.delete_forever),
          ),
        ),
      ),
    );

    await wTester.tap(find.byType(Icon));
    expect(find.byTooltip('Cancel all notifications'), findsWidgets);
  });

  testWidgets('PushNotif Button changes mouse cursor when hovered!',
      (WidgetTester wTester) async {
    await wTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton.extended(
              onPressed: () {},
              mouseCursor: SystemMouseCursors.text,
              label: const Text('View Recall'),
              icon: const Icon(Icons.outgoing_mail),
            ),
          ),
        ),
      ),
    );

    final TestGesture gesture =
        await wTester.createGesture(kind: PointerDeviceKind.mouse, pointer: 1);
    await gesture.addPointer(
        location: wTester.getCenter(find.byType(FloatingActionButton)));
    await wTester.pump();

    expect(RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.text);

    await wTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              onPressed: () {},
              mouseCursor: SystemMouseCursors.text,
              child: const Icon(Icons.outgoing_mail),
            ),
          ),
        ),
      ),
    );

    await gesture.moveTo(wTester.getCenter(find.byType(FloatingActionButton)));
    expect(RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.text);

    await wTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.outgoing_mail),
            ),
          ),
        ),
      ),
    );

    expect(RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.click);

    await wTester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.delete_forever),
            ),
          ),
        ),
      ),
    );

    expect(RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.basic);
  });

  testWidgets('PushNotif Button .large is the correct size!',
      (WidgetTester wTester) async {
    final Key csize = UniqueKey();

    await wTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton.large(
            key: csize,
            onPressed: null,
          ),
        ),
      ),
    );

    expect(wTester.getSize(find.byKey(csize)), const Size(96.0, 96.0));
  });
}
