import 'package:app_note/cubits/cubit/add_note_cubit.dart';
import 'package:app_note/models/note_model.dart';
import 'package:app_note/view/widgets/custom_button.dart';
import 'package:app_note/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFormNoteState extends StatefulWidget {
  const AddFormNoteState({
    super.key,
  });

  @override
  State<AddFormNoteState> createState() => _AddFormNoteStateState();
}

class _AddFormNoteStateState extends State<AddFormNoteState> {
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
            onSave: (p0) {
              title = p0;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: 'Content',
            maxLine: 5,
            onSave: (p0) => subTitle = p0,
          ),
          const SizedBox(
            height: 33,
          ),
          // Spacer(),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: DateTime.now().toString(),
                    color: Colors.blue.value);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
