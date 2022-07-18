import 'package:blagorodni/managers/firestore_manager.dart';
import 'package:blagorodni/managers/shared_preference_manager_impl.dart';

abstract class NotesRepository {
  Future<void> addNote(String title, String description, bool isFavorite);
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
}
