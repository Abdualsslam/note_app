import 'package:app_note/view/widgets/custom_button.dart';
import 'package:app_note/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: AddFormNoteState(),
      ),
    );
  }
}

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
