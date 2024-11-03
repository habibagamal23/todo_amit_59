import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomFormTextField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    required this.labelText,
    required this.controller,
    this.isObscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.purpleAccent),
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
      ),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12),
    );
  }
}
