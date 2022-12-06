import 'package:flutter/material.dart';

//New List Creation function with the check mark class to remove each
//Item from the list when the user is done with the item.
class LList {
  LList({required this.name, required this.checked});
  final String name;
  bool checked;
}

class ListItem extends StatelessWidget {
  ListItem({
    required this.list,
    required this.onListChanged,
  }) : super(key: ObjectKey(list));

  final LList list;
  final onListChanged;
//This is the line through checkbox style.
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.red,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onListChanged(list);
      },
      leading: CircleAvatar(
        child: Text(list.name[0]),
      ),
      title: Text(list.name, style: _getTextStyle(list.checked)),
    );
  }
}

class GList extends StatefulWidget {
  @override
  _GListState createState() => new _GListState();
}

class _GListState extends State<GList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<LList> _lists = <LList>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Grocery list'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _lists.map((LList list) {
          return ListItem(
            list: list,
            onListChanged: _handleListChange,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  void _handleListChange(LList list) {
    setState(() {
      list.checked = !list.checked;
    });
  }

  void _addListItem(String name) {
    setState(() {
      _lists.add(LList(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new grocery item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new item'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addListItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Grocery list',
      home: new GList(),
    );
  }
}

void main() => runApp(new ListApp());
