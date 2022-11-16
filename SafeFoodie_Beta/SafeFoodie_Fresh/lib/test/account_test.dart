import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:safefoodie_fresh/screens/account.dart';
import 'package:flutter_test/flutter_test.dart';
import '';

void main() {
  // user toggle test
  testWidgets('Switch can toggle on tap', (WidgetTester tester) async {
    final Key switchKey = UniqueKey();
    bool value = false;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MaterialApp(
              home: Material(
                child: Center(
                  child: Switch(
                    key: switchKey,
                    value: value,
                    onChanged: (bool newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    expect(value, isFalse);
    await tester.tap(find.byKey(switchKey));
    expect(value, isTrue);
  });

// test 2 - navigation bar switch for resizing upon other function calls
  testWidgets('BottomNavigationBar centered landscape layout',
      (WidgetTester tester) async {
    final Key icon0 = UniqueKey();
    final Key icon1 = UniqueKey();

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SizedBox(key: icon0, width: 200, height: 10),
                    label: 'Title0',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(key: icon1, width: 200, height: 10),
                    label: 'Title1',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    expect(tester.getSize(find.byType(BottomNavigationBar)),
        const Size(800, kBottomNavigationBarHeight));
    expect(tester.getRect(find.byType(BottomNavigationBar)),
        const Rect.fromLTRB(0, 600 - kBottomNavigationBarHeight, 800, 600));

    expect(tester.getRect(find.text('Title0')),
        const Rect.fromLTRB(208.0, 570.0, 292.0, 584.0));
    expect(tester.getRect(find.byKey(icon0)),
        const Rect.fromLTRB(150.0, 560.0, 350.0, 570.0));
    expect(tester.getRect(find.byKey(icon1)),
        const Rect.fromLTRB(450.0, 560.0, 650.0, 570.0));
  });

// test 3 - count user lists
  testWidgets('Counter increments test', (tester) async {
    await tester.pumpWidget(MyApp(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });

// Test 4. -

  testWidgets('Create and delete list', (tester) async {
    await tester.pumpWidget(const TodoList());

    await tester.enterText(find.byType(TextField), 'bananaword');

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    expect(find.text('bananaword'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));

    await tester.pumpAndSettle();

    expect(find.text('bananaword'), findsNothing);
  });

// test 5 - check if search can find it's key

  testWidgets('finds a widget using a Key', (tester) async {
    // Define the  key.
    const testKey = Key('search');

    // Build with the testKey.
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });

// unit test

  testWidgets('PopupMenu inherits app theme', (WidgetTester tester) async {
    final Key displaymenu = UniqueKey();
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              PopupMenuButton<String>(
                key: displaymenu,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(child: Text('Item')),
                  ];
                },
              ),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(displaymenu));
    await tester.pump(const Duration(seconds: 1));

    expect(Theme.of(tester.element(find.text('Item'))).brightness,
        equals(Brightness.dark));
  });
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return Dismissible(
                    key: Key('$todo$index'),
                    onDismissed: (direction) => todos.removeAt(index),
                    background: Container(color: Colors.red),
                    child: ListTile(title: Text(todo)),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          key: const Key('long_list'),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index],
                key: Key('item_${index}_text'),
              ),
            );
          },
        ),
      ),
    );
  }

// test 5

}
