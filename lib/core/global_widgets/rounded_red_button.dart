import 'package:flutter/material.dart';

class RoundedRedButton extends StatelessWidget {
  const RoundedRedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0)),
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
