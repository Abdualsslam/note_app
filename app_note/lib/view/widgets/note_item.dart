import 'package:app_note/view/edit_note_view.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteView(),
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
              title: const Text(
                'Flutter Tips',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: const Text(
                ' asfadfasdfasdf asdfasdfasdfasd sdfasfasfsad asdfssfsdfasf sdfasfasdf asdfsadfsdf asdfsadfasf',
                style: TextStyle(color: Colors.black54),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 33,
                    color: Colors.black,
                  )),
            ),
            const Text(
              'Flutter Tips',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
