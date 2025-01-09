import 'package:app_note/models/note_model.dart';
import 'package:app_note/view/edit_note_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteItem extends StatelessWidget {
  NoteItem({super.key, required this.note});
  NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditNoteView(),
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.orangeAccent.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                note.subTitle,
                style: const TextStyle(color: Colors.black54),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 33,
                    color: Colors.black,
                  )),
            ),
            Text(
              note.date,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
