import 'package:app_note/cubits/read_notes/notes_cubit.dart';
import 'package:app_note/models/note_model.dart';
import 'package:app_note/view/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> note = state is NotesSuccess ? state.notes : [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            itemCount: state is NotesSuccess ? state.notes.length : 0,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: NoteItem(note: note[index]),
            ),
          ),
        );
      },
    );
  }
}
