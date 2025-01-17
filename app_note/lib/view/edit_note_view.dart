import 'package:app_note/models/note_model.dart';
import 'package:app_note/view/widgets/edit_note_view_body.dart';
import 'package:flutter/material.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({super.key, required this.note});
  NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(note: note));
  }
}
