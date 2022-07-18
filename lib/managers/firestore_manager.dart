import 'package:blagorodni/models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreManager {
  Future<void> addNote(String title, String description, bool isFavorite, String userId);

  Future<List<Note>> getNotes(String userId);

  Future<void> changeFavorite(bool isFavorite, String id);

  Future<void> editNote(String title, String description, String id);

  Future<void> deleteNote(String id);
}

class FireStoreManagerImpl implements FireStoreManager {
  CollectionReference notesCollection = FirebaseFirestore.instance.collection('notes');

  @override
  Future<void> addNote(String title, String description, bool isFavorite, String userId) async {
    notesCollection.add(
      {
        'title': title,
        'description': description,
        'isFavorite': isFavorite,
        'userId': userId,
        'creationDate': Timestamp.now(),
        'editingDate': Timestamp.now(),
        'id': Timestamp.now().millisecondsSinceEpoch.toString(),
      },
    );
  }

  @override
  Future<List<Note>> getNotes(String userId) async {
    final snapshot = await notesCollection.where('userId', isEqualTo: userId).get();

    return snapshot.docs.map((item) {
      final Map<String, dynamic> data = item.data() as Map<String, dynamic>;
      return Note(
        title: data['title'] as String,
        description: data['description'] as String,
        uid: data['userId'] as String,
        creationDate: data['creationDate'] as Timestamp,
        editingDate: data['editingDate'] as Timestamp,
        isFavorite: data['isFavorite'] as bool,
        id: item.id,
      );
    }).toList();
  }

  @override
  Future<void> changeFavorite(bool isFavorite, String id) async {
    await notesCollection.doc(id).update({'isFavorite': isFavorite});
  }

  @override
  Future<void> deleteNote(String id) async {
    await notesCollection.doc(id).delete();
  }

  @override
  Future<void> editNote(String title, String description, String id) async {
    await notesCollection.doc(id).update(
      {
        'title': title,
        'description': description,
      },
    );
  }
}
