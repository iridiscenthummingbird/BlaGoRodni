import 'package:blagorodni/models/note.dart';
import 'package:blagorodni/repositories/notes_repository.dart';
import 'package:blagorodni/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.userRepository,
    required this.notesRepository,
  }) : super(MainInitial());
  final UserRepository userRepository;
  final NotesRepository notesRepository;

  void logout() {
    userRepository.logout();
  }

  Future<void> getNotes({bool shouldRefresh = true}) async {
    if (shouldRefresh) {
      emit(MainLoadingState());
    }
    emit(
      MainNotesLoadedState(
        notes: await notesRepository.getNotes(),
      ),
    );
  }

  Future<void> changeFavorite(bool isFavorite, String id) async {
    await notesRepository.changeFavorite(isFavorite, id);
  }
}
