import 'package:app_note/cubits/add_notes/add_note_cubit.dart';
import 'package:app_note/cubits/read_notes/notes_cubit.dart';
import 'package:app_note/models/note_model.dart';
import 'package:app_note/view/widgets/color+_listview.dart';
import 'package:app_note/view/widgets/custom_button.dart';
import 'package:app_note/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          CustomTextField(
            hint: 'Title',
            onChange: (p0) {
              title = p0;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: 'Content',
            maxLine: 5,
            onChange: (p0) => subTitle = p0,
          ),
          const SizedBox(
            height: 10,
          ),
          const ColorListView(),
          const SizedBox(
            height: 10,
          ),
          // Spacer(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: DateFormat.yMMMd().format(DateTime.now()),
                        color: Colors.blue.g.toInt());
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);

                    context.read<NotesCubit>().fetchAllNotes();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
