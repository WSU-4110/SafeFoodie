import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safefoodie_login_merge/Firebase/cloud/cloud_consts.dart';
import 'package:safefoodie_login_merge/Firebase/cloud/cloud_note.dart';
import 'package:safefoodie_login_merge/Firebase/cloud/cloud_excep.dart';

class FirebaseCloudStorage {
  //reference collections in database
  final notes = FirebaseFirestore.instance.collection('userAccounts');

  // Method to create new notes and store them into the Cloud Firestore database.
  Future<CloudNote> createNewNote({required String ownerUserId}) async {
    final document = await notes.add({
      ownerUserIdFieldName: ownerUserId,
      textFieldName: '',
    });

    final fetchedNote = await document.get();
    return CloudNote(
      docID: fetchedNote.id,
      uid: fetchedNote.id,
      text: '',
    );
  }

  //delete note
  Future<void> deleteNote({required String docID}) async {
    try {
      // notes.doc(documentId) is the path towards the specific note document
      // that is in the "notes" collection
      await notes.doc(docID).delete();
    } catch (e) {
      throw CouldNotDeleteNoteException();
    }
  }

  //update note
  Future<void> updateNote({
    required String docID,
    required String text,
  }) async {
    try {
      await notes.doc(docID).update({textFieldName: text});
    } catch (e) {
      throw CouldNotUpdateNoteException();
    }
  }

  //get notes for user
  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) {
    final allNotes = notes
        .where(ownerUserIdFieldName, isEqualTo: ownerUserId)
        .snapshots()
        .map((event) => event.docs.map((doc) => CloudNote.fromSnapshot(doc)));
    return allNotes;
  }

  // Instance that calls to private factory constructor
  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();

  // Private factory constructor
  FirebaseCloudStorage._sharedInstance();

  // Singleton constructor that calls to the _shared instance
  factory FirebaseCloudStorage() => _shared;
}
