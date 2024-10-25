import 'package:app_note/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 22,
          ),
          CustomTextField(
            hint: 'Title',
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: 'Content',
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
