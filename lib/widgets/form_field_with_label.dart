import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines,
    this.controllerl,
    this.validator,
  });
  final String title;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controllerl;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 8),
        TextFormField(
          controller: controllerl,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(hintText: hintText),
          maxLines: maxLines,
          validator: validator,
        ),
      ],
    );
  }
}
