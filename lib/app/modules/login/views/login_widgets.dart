import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/modules/login/controllers/login_controller.dart';
import 'package:stellar/app/utils/decorations.dart';

class TLoginTextField extends StatelessWidget {
  final LoginController controller;
  final String label;
  final IconData icon;

  const TLoginTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        style: Get.textTheme.bodySmall,
        onChanged: controller.onChangedEmail,
        decoration: InputDecoration(
          prefixIconColor: controller.isEmailFieldEmpty
              ? const Color(0xFFA1A8B0)
              : Get.theme.primaryColor,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            borderSide: BorderSide(
              color: controller.isEmailFieldEmpty
                  ? const Color(0xFFA1A8B0)
                  : Get.theme.primaryColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            borderSide: BorderSide(
              color: controller.isEmailFieldEmpty
                  ? const Color(0xFFA1A8B0)
                  : Get.theme.primaryColor,
              width: 1.0,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0, 16, 0),
            child: Icon(
              icon,
              size: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}

class TLoginPasswordTextField extends StatelessWidget {
  final LoginController controller;
  final String label;
  final IconData icon;

  const TLoginPasswordTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        style: Get.textTheme.bodySmall,
        onChanged: controller.onChangePassword,
        autocorrect: false,
        enableSuggestions: false,
        obscureText: controller.isPassObscured.value,
        decoration: InputDecoration(
          prefixIconColor: controller.isPasswordFieldEmpty
              ? const Color(0xFFA1A8B0)
              : Get.theme.primaryColor,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(24.0),
            ),
            borderSide: BorderSide(
              color: controller.isPasswordFieldEmpty
                  ? const Color(0xFFA1A8B0)
                  : Get.theme.primaryColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            borderSide: BorderSide(
              color: controller.isPasswordFieldEmpty
                  ? const Color(0xFFA1A8B0)
                  : Get.theme.primaryColor,
              width: 1.0,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0, 16, 0),
            child: Icon(
              icon,
              size: 24.0,
            ),
          ),
          suffixIcon: TextButton(
            onPressed: controller.onTogglePassObscure,
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (states) => Colors.transparent,
              ),
            ),
            child: Icon(
              controller.isPassObscured.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: const Color(0xFFA1A8B0),
              size: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}

class TLoginTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String regularText;
  final String highLightedText;

  const TLoginTextButton({
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

class TLoginDivider extends StatelessWidget {
  final String? text;
  const TLoginDivider({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFE5E7EB),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Text(
            text ?? "OR",
            style: Get.textTheme.labelMedium,
          ),
        ),
        Expanded(
            child: Container(
          height: 1,
          color: const Color(0xFFE5E7EB),
        )),
      ],
    );
  }
}

class TLoginOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final String iconPath;

  const TLoginOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                side: BorderSide(color: Color(0xFFE5E7EB)),
              ),
              elevation: 0.0,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 16.0,
              ),
            ),
            child: Row(
              children: [
                Image.asset(iconPath, width: 20.0),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: Get.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
