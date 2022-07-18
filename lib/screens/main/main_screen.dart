import 'package:blagorodni/localization/localization.dart';
import 'package:blagorodni/models/note.dart';
import 'package:blagorodni/screens/login/login_screen.dart';
import 'package:blagorodni/screens/main/cubit/main_cubit.dart';
import 'package:blagorodni/screens/main/widgets/card.dart';
import 'package:blagorodni/screens/note/note_screen.dart';
import 'package:blagorodni/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainCubit _cubit;

  @override
  void initState() {
    _cubit = MainCubit(
      userRepository: context.read(),
      notesRepository: context.read(),
    );
    _cubit.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NoteScreen.routeName);
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      drawer: CustomDrawer(
        logout: () {
          _cubit.logout();
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).mainScreen.myNotes,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: _cubit,
          builder: (context, state) {
            if (state is MainNotesLoadedState) {
              final List<Note> notes = state.notes;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RefreshIndicator(
                  color: Colors.black,
                  onRefresh: () async => await _cubit.getNotes(),
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return NoteCard(
                        note: notes[index],
                        changeFavorite: (isFavorite, id) async {
                          await _cubit.changeFavorite(isFavorite, id);
                        },
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
