import 'package:flutter/material.dart';
import 'package:quis_app/components/color.dart';

class AlertOption extends StatelessWidget {
  const AlertOption({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: foregroundColor,
      title: Text(
        "Oops!",
        style: TextStyle(
          color: Colors.red.shade600,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        "Select Option Goblok!!!",
        style: TextStyle(
          color: backgroundColor,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    );
  }
}
