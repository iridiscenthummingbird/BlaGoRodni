import 'note.dart';

class User {
  User({
    required this.id,
  });

  String id;
  List<Note>? notes;
}
