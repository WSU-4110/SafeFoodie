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
          AppBar(centerTitle: true, title: const Text('Grocery')),
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
      key: ValueKey(record.item),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.item),
        ),
      )
      );
  }
}
CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('userInfo').doc('F3qaDYAfGPKZPgbuj5nZ').collection('items');

Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
}

class Record {
  final String item;
  final DocumentReference? reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : item = map['items'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$item>";
}
