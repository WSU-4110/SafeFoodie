//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'dart:async';

//New List Creation function with the check mark class to remove each
//Item from the list when the user is done with the item.
class LList {
  LList({required this.name, required this.expired, required this.checked});
  final String name;
  final DateTime expired;
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

    return const TextStyle(
      color: Color.fromARGB(216, 230, 182, 53),
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
      final formattedDate = DateFormat('EEEE, MMM d, yyyy').format(list.expired);
    return ListTile(
      onTap: () {
        onListChanged(list);
      },
      leading: CircleAvatar(
        child: Text(list.name[0]),
      ),
      title: Text(list.name, style: _getTextStyle(list.checked)),
        trailing: Text(formattedDate.toString()),
    );
  }
}

class GList extends StatefulWidget {
  const GList({Key? key}) : super(key: key);
  @override
  _GListState createState() => new _GListState();
}

class _GListState extends State<GList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<LList> _lists = <LList>[];
  final db = FirebaseFirestore.instance.collection('userInfo');

  //Initialize the current date
  DateTime currentDate = DateTime.now();
  Future addItem(String item, String date) async {
    await db
        .doc('F3qaDYAfGPKZPgbuj5nZ')
        .collection('items')
        .add({
      'item': item,
      'date': date,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Grocery list'),
        backgroundColor: Colors.green,
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

  //Add item to list
  void _addListItem(String name, DateTime expired) {
    setState(() {
      _lists.add(LList(name: name, expired: expired, checked: false));
      addItem(name, expired.toString());
    });
    _textFieldController.clear();
  }

  //Adding an item to the grocery list dialog
  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new grocery item'),
          //backgroundColor: Colors.green,
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new item'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _selectDate(context);
                _addListItem(_textFieldController.text, currentDate);
              },
            ),
          ],
        );
      },
    );
  }

  //select date function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        currentDate = selectedDate;
      });
    }
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

void main() => runApp(ListApp());
