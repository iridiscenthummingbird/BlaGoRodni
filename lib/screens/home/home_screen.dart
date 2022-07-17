import 'package:flutter/material.dart';
import '../../models/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  
  //Test data
  List<Note> testNotes = [
    Note(title: 'Title', description: 'Go'),
    Note(title: '1111', description: 'Go'),
    Note(
        title: '2222',
        description: 'Lodcscccccddsdsdsdsdfsdfdsfds\nfsd\nfsdfdsfdsfsd'),
    Note(title: '3333', description: 'Ho'),
    Note(title: '1111', description: 'Go'),
    Note(title: '1111', description: 'Go'),
    Note(title: '1111', description: 'Go'),
    Note(title: '1111', description: 'Go'),
  ];

  final List<bool> _isFavorited = List.filled(8, false);
  ///


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Color must to be added to resourse/app_colors.dart
        backgroundColor: const Color(0xff57737C),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: _MainTitleText(),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: testNotes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      shadowColor: Colors.black,
                      elevation: 15,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _TitleNotesText(
                                  text: testNotes[index].title,
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () => setState(() =>
                                      _isFavorited[index] =
                                          !_isFavorited[index]),
                                  icon: _isFavorited[index]
                                      ? const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        )
                                      : const Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                        ),
                                ),
                              ],
                            ),
                            _NoteText(
                              text: testNotes[index].description,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff28C724),
          child: Icon(
            size: 40.0,
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  _NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      shadowColor: Colors.black,
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _TitleNotesText(
                  text: note.title,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    note.isPriority = !note.isPriority;
                  },
                  icon: note.isPriority
                      ? const Icon(Icons.favorite)
                      : const Icon(
                          Icons.favorite_border,
                        ),
                ),
              ],
            ),
            _NoteText(
              text: note.description,
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class _NoteText extends StatelessWidget {
  _NoteText({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _MainTitleText extends StatelessWidget {
  const _MainTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'My Notes',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 40,
      ),
    );
  }
}

class _TitleNotesText extends StatelessWidget {
  _TitleNotesText({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
