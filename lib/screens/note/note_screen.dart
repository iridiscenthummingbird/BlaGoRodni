import 'package:blagorodni/localization/localization.dart';
import 'package:blagorodni/models/note.dart';
import 'package:blagorodni/screens/note/cubit/note_cubit.dart';
import 'package:blagorodni/screens/note/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NoteState { create, edit }

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    Key? key,
    this.note,
  }) : super(key: key);

  static const String routeName = '/note';
  final Note? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late final NoteState noteState;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late final NoteCubit _cubit;

  bool isFavorite = false;

  bool isChanged = false;

  @override
  void initState() {
    _cubit = NoteCubit(notesRepository: context.read());
    if (widget.note != null) {
      noteState = NoteState.edit;
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
      isFavorite = widget.note!.isFavorite;
    } else {
      noteState = NoteState.create;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isChanged) {
          final bool? shouldSave = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context).noteScreen.doYouWantSave),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(
                      AppLocalizations.of(context).noteScreen.yes,
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                      AppLocalizations.of(context).noteScreen.no,
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
          if (shouldSave == true) {
            if (_formKey.currentState?.validate() ?? false) {
              if (noteState == NoteState.create) {
                await _cubit.addNote(
                  _titleController.text,
                  _descriptionController.text,
                  isFavorite,
                );
              } else {
                await _cubit.editNote(
                  _titleController.text,
                  _descriptionController.text,
                  widget.note!.id,
                );
              }
            }
          }
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).iconTheme.color,
          actions: [
            FavoriteButton(
              isFavorite: isFavorite,
              onTap: () async {
                setState(() {
                  isFavorite = !isFavorite;
                });
                if (noteState == NoteState.edit) {
                  print(isFavorite);
                  await _cubit.changeFavorite(isFavorite, widget.note!.id);
                }
              },
            ),
            if (noteState == NoteState.create) ...{
              IconButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await _cubit.addNote(
                      _titleController.text,
                      _descriptionController.text,
                      isFavorite,
                    );
                  }
                },
                icon: const Icon(Icons.check),
              ),
            } else ...{
              IconButton(
                onPressed: () async {
                  await _cubit.deleteNote(widget.note!.id);
                },
                icon: const Icon(Icons.delete_outline),
              ),
              IconButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await _cubit.editNote(
                      _titleController.text,
                      _descriptionController.text,
                      widget.note!.id,
                    );
                  }
                },
                icon: const Icon(Icons.check),
              ),
            }
          ],
        ),
        body: BlocListener(
          bloc: _cubit,
          listener: (context, state) {
            if (state is NoteSuccessedState) {
              Navigator.pop(context, true);
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      validator: (input) {
                        if (input != null && input.isEmpty) {
                          return AppLocalizations.of(context).noteScreen.titleRequired;
                        }
                        return null;
                      },
                      onChanged: (_) {
                        isChanged = true;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).noteScreen.title,
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _descriptionController,
                        expands: true,
                        maxLines: null,
                        onChanged: (_) {
                          isChanged = true;
                        },
                        validator: (input) {
                          if (input != null && input.isEmpty) {
                            return AppLocalizations.of(context).noteScreen.descriptionRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context).noteScreen.description,
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
