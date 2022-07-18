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
    emit(NoteCreatedState());
  }
}
