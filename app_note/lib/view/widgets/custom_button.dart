import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 52, 220, 249),
          borderRadius: BorderRadius.circular(16)),
      child: const Center(
        child: Text(
          'Add',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
