import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safefoodie_fresh/services/auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudNote {
  final String documentId;

  const CloudNote({
    required this.documentId,
  });

  // Factory constructor to make a CloudNote object from a
  // QueryDocumentSnapshot object which is from Cloud Firestore.
  // A document in represented as a QueryDocumentSnapshot.
  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id;
}