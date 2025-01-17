import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({super.key, required this.icon, this.save});
  final IconData icon;
  void Function()? save;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: save,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(16)),
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
