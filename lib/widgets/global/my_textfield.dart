import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  const MyTextField({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              strokeAlign: 20,
              width: 1.8,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: Colors.blue.shade800,
              strokeAlign: 20,
              width: 1.8,
            ),
          ),
          filled: true,
          fillColor: const Color.fromARGB(97, 187, 222, 251),
          hintText: text,
        ),
      ),
    );
  }
}
