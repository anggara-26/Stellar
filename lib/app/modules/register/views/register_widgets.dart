import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/utils/decorations.dart';

class TRegisterTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  const TRegisterTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Get.textTheme.bodySmall,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 0, 16, 0),
          child: Icon(icon, size: 24.0),
        ),
      ),
    );
  }
}

class TRegisterTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String regularText;
  final String highLightedText;

  const TRegisterTextButton({
    super.key,
    required this.onPressed,
    required this.regularText,
    required this.highLightedText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TDecorations.textButtonDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$regularText ", style: Get.textTheme.bodySmall),
          Text(highLightedText, style: Get.textTheme.displaySmall)
        ],
      ),
    );
  }
}
