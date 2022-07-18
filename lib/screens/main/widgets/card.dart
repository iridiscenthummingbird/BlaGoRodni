import 'package:blagorodni/models/note.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.changeFavorite,
  }) : super(key: key);
  final Note note;
  final Function(bool, String) changeFavorite;
  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.note.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: 270,
                    child: Text(
                      widget.note.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    await widget.changeFavorite(isFavorite, widget.note.id);
                  },
                  icon: isFavorite
                      ? const Icon(
                          Icons.star,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.star_outline,
                          color: Colors.black,
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.note.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
