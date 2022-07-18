import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String title;
  final String description;
  final String uid;
  final Timestamp creationDate;
  final Timestamp editingDate;
  final bool isFavorite;
  final String id;

  Note({
    required this.title,
    required this.description,
    required this.uid,
    required this.creationDate,
    required this.editingDate,
    required this.isFavorite,
    required this.id,
  });
}
