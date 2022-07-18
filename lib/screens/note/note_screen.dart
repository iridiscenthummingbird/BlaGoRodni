import 'package:blagorodni/screens/note/cubit/note_cubit.dart';
import 'package:blagorodni/screens/note/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NoteState { create, edit }

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    Key? key,
    this.noteState = NoteState.create,
  }) : super(key: key);

  static const String routeName = '/note';
  final NoteState noteState;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late final NoteCubit _cubit;

  bool isFavorite = false;

  @override
  void initState() {
    _cubit = NoteCubit(notesRepository: context.read());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          FavoriteButton(
            isFavorite: isFavorite,
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
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
        ],
      ),
      body: BlocListener(
        bloc: _cubit,
        listener: (context, state) {
          if (state is NoteCreatedState) {
            Navigator.pop(context);
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
                        return 'Title is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Title',
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
                      validator: (input) {
                        if (input != null && input.isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: 'Description',
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
    );
  }
}
