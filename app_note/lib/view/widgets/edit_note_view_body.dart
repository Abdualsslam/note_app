import 'package:app_note/cubits/read_notes/notes_cubit.dart';
import 'package:app_note/models/note_model.dart';
import 'package:app_note/view/widgets/custom_app_bar.dart';
import 'package:app_note/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody({super.key, required this.note});
  NoteModel note;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            save: () {
              note.title = title ?? note.title;
              note.subTitle = subTitle ?? note.subTitle;
              note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 22,
          ),
          CustomTextField(
            hint: note.title ?? 'Title',
            onChange: (p1) {
              title = p1 ?? title;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: note.subTitle ?? 'Content',
            maxLine: 5,
            onChange: (value) {
              subTitle = value == '' ? subTitle : value!;
            },
          ),
        ]));
  }
}
