import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.controller,
    this.hintText = "",
    required this.title,
    this.passwordMode = false,
  });

  final TextEditingController controller;
  final String hintText;
  final String title;
  final bool passwordMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: const Color(0xff000000).withOpacity(.25)),
            filled: true,
            fillColor: const Color(0xff000000).withOpacity(.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color(0xff000000).withOpacity(.1), width:2),
              // borderSide: BorderSide(color: Color(0xff000000).withOpacity(.1), width:2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          ),
          keyboardType: TextInputType.emailAddress,
          obscureText: passwordMode,
        ),
      ],
    );
  }
}