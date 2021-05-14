import 'package:flutter/material.dart';

class LabelFieldWidget extends StatelessWidget {
  const LabelFieldWidget({
    Key? key,
    required this.label,
    this.hint,
    this.labelColor,
    this.borderColor,
    this.focusedBorderColor,
    this.onChanged,
    this.node,
  }) : super(key: key);

  final String label;
  final String? hint;
  final Color? labelColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final FocusNode? node;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: node,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: labelColor),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor ?? Colors.red),
        ),
      ),
    );
  }
}
