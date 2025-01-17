import 'package:app_note/view/widgets/custom_icon_appbar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title, required this.icon, this.save});
  final String title;
  final IconData icon;
  void Function()? save;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 33),
        ),
        const Spacer(),
        CustomIcon(
          icon: icon,
          save: save,
        )
      ],
    );
  }
}
