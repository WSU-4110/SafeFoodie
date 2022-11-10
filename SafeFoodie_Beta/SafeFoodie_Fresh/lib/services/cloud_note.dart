import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safefoodie_fresh/services/cloud_note_constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudNote {
  final String documentId;
  final String ownerUserId;
  final String text;

  const CloudNote({
    required this.documentId,
    required this.ownerUserId,
    required this.text,
  });

  // Factory constructor to make a CloudNote object from a
  // QueryDocumentSnapshot object which is from Cloud Firestore.
  // A document in represented as a QueryDocumentSnapshot.
  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName],
        text = snapshot.data()[textFieldName] as String;
}