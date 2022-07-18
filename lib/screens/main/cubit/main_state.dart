part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainNotesLoadedState extends MainState {
  final List<Note> notes;

  MainNotesLoadedState({required this.notes});
}
