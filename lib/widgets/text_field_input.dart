import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    required this.textEditingController, 
    this.isPass = false, 
    required this.hintText, 
    required this.textInputType, 
    super.key});

  @override
  Widget build(BuildContext context) {
    final inputBoder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context)
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border:  OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: inputBoder,
        enabledBorder: inputBoder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}