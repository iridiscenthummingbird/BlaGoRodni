import 'package:blagorodni/extentions/error_handler.dart';
import 'package:blagorodni/repositories/notes_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit({required this.notesRepository}) : super(NoteInitial());
  final NotesRepository notesRepository;

  Future<void> addNote(String title, String description, bool isFavorite) async {
    await notesRepository.addNote(title, description, isFavorite).withErrorHandler(this);
    emit(NoteSuccessedState());
  }

  Future<void> changeFavorite(bool isFavorite, String id) async {
    await notesRepository.changeFavorite(isFavorite, id);
  }

  Future<void> editNote(String title, String description, String id) async {
    await notesRepository.editNote(title, description, id);
    emit(NoteSuccessedState());
  }

  Future<void> deleteNote(String id) async {
    await notesRepository.deleteNote(id);
    emit(NoteSuccessedState());
  }
}
