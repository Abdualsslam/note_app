import 'package:app_note/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Note',
          style: TextStyle(fontSize: 33),
        ),
        Spacer(),
        CustomSearch()
      ],
    );
  }
}
