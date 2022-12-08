import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

void main() {
  runApp(const AddtoList());
}

class AddtoList extends StatefulWidget {
  const AddtoList({Key? key}) : super(key: key);

  @override
  State<AddtoList> createState() => _AddtoList();
}

class _AddtoList extends State<AddtoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text('Lists')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('userInfo').doc('F3qaDYAfGPKZPgbuj5nZ').collection('items').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();

        return _buildList(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    inspect(data);
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.listTitle),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.listTitle),
          trailing: Text(record.items.toString()),
            onTap: () => record.reference!.update({'userInfo':  record.items + 1})),
        ),
      );
  }
}

class Record {
  final String listTitle;
  final int items;
  final DocumentReference? reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : listTitle = map['listTitle'],
        items = map['items'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$listTitle:$items>";
}
