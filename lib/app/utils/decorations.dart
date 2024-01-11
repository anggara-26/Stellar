import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TDecorations {
  /* Button Decoration */
  // Text Button Decoration
  static final textButtonDecoration = Get.theme.textButtonTheme.style?.copyWith(
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (states) => Colors.transparent,
    ),
  );

  /* TextField Decoration */
  // Password TextField Decoration
  // Used for password text field, add suffix icon to toggle password visibility
  static passwordTextFieldDecoration(toggleController, isPassObscured) =>
      InputDecoration(
        labelText: "Masukkan Password",
        prefixIcon: const Padding(
          padding: EdgeInsets.fromLTRB(24.0, 0, 16, 0),
          child: Icon(
            Icons.password_outlined,
            size: 24.0,
          ),
        ),
        suffixIcon: TextButton(
          onPressed: toggleController,
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Colors.transparent,
            ),
          ),
          child: Icon(
            isPassObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: const Color(0xFFA1A8B0),
            size: 24.0,
          ),
        ),
      );
}
