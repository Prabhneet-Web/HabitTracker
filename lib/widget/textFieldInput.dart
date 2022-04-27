import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final isPass;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;

  const TextFieldInput({
    Key? key,
    this.isPass = false,
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(25),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        textCapitalization: TextCapitalization.words,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.grey.shade400),
            enabledBorder: inputBorder,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: iconColor),
              borderRadius: BorderRadius.circular(25.0),
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
