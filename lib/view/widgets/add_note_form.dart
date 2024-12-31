import 'package:app_note/cubits/add_notes/add_note_cubit.dart';
import 'package:app_note/models/note_model.dart';
import 'package:app_note/view/widgets/custom_button.dart';
import 'package:app_note/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        date: DateTime.now().toString(),
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    // try {
                    //   var box = Hive.box<NoteModel>(kNotesBox); // افتح الصندوق
                    //   for (int i = 0; i < box.length; i++) {
                    //     var note = box.getAt(i); // استعرض البيانات
                    //     print(
                    //         "Note $i: ${note?.title}, ${note?.subTitle}, ${note?.date}, ${note?.color}");
                    //   }
                    // } catch (e) {
                    //   print("Error fetching notes: $e");
                    // }
                    debugPrint("add ******");
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
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
