import 'package:flutter/material.dart';

class TitleCalendarField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isDatePicker;

  const TitleCalendarField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isDatePicker = false,
  });

  @override
  State<TitleCalendarField> createState() => _TitleCalendarFieldState();
}

class _TitleCalendarFieldState extends State<TitleCalendarField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      String formattedDate = "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";
      widget.controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Treatment Date"),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          readOnly: true, // Make TextField read-only
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: const Color(0xff000000).withOpacity(.25)),
            filled: true,
            fillColor: const Color(0xff000000).withOpacity(.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: const Color(0xff000000).withOpacity(.1),
                  width: 2
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13
            ),
            suffixIcon: const Icon(
              Icons.calendar_today,
              color: Color(0xff006837),
            ),
          ),
        ),
      ],
    );
  }
}