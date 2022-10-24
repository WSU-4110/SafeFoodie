import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:safefoodie_login_merge/Firebase/cloud/cloud_consts.dart';

@immutable
class CloudNote {
  final String docID;
  final String uid;
  final String text;

  const CloudNote({
    required this.docID,
    required this.uid,
    required this.text,
  });

  // Factory constructor to make a CloudNote object from a
  // QueryDocumentSnapshot object which is from Cloud Firestore.
  // A document in represented as a QueryDocumentSnapshot.
  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : docID = snapshot.id,
        uid = snapshot.data()[ownerUserIdFieldName],
        text = snapshot.data()[textFieldName] as String;
}
