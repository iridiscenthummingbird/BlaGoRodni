import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreManager {
  Future<void> addNote(String title, String description, bool isFavorite, String userId);
}

class FireStoreManagerImpl implements FireStoreManager {
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  @override
  Future<void> addNote(String title, String description, bool isFavorite, String userId) async {
    notes.add(
      {
        'title': title,
        'description': description,
        'isFavorite': isFavorite,
        'userId': userId,
        'creationDate': Timestamp.now(),
        'editingDate': Timestamp.now(),
      },
    );
  }
}
