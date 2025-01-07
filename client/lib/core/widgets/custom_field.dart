import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final bool isObscureText;
  final TextEditingController? controller;
  final String hintText;
  final bool readOnly;
  final VoidCallback? onTap;
  const CustomField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscureText = false,
      this.readOnly = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
