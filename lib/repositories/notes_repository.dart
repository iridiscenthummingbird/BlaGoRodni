import 'package:blagorodni/managers/firestore_manager.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';
import 'package:blagorodni/models/note.dart';

abstract class NotesRepository {
  Future<void> addNote(String title, String description, bool isFavorite);

  Future<List<Note>> getNotes();

  Future<void> changeFavorite(bool isFavorite, String id);

  Future<void> editNote(String title, String description, String id);

  Future<void> deleteNote(String id);
}

class NotesRepositoryImpl extends NotesRepository {
  NotesRepositoryImpl({required this.sharedPreferenceManager, required this.fireStoreManager});

  final SharedPreferenceManager sharedPreferenceManager;
  final FireStoreManager fireStoreManager;

  @override
  Future<void> addNote(String title, String description, bool isFavorite) async {
    await fireStoreManager.addNote(
      title,
      description,
      isFavorite,
      sharedPreferenceManager.getUid(),
    );
  }

  @override
  Future<List<Note>> getNotes() async {
    return await fireStoreManager.getNotes(sharedPreferenceManager.getUid());
  }

  @override
  Future<void> changeFavorite(bool isFavorite, String id) async {
    await fireStoreManager.changeFavorite(isFavorite, id);
  }

  @override
  Future<void> deleteNote(String id) async {
    await fireStoreManager.deleteNote(id);
  }

  @override
  Future<void> editNote(String title, String description, String id) async {
    await fireStoreManager.editNote(title, description, id);
  }
}
