import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/modules/email_verification/controllers/email_verification_controller.dart';
import 'package:stellar/app/utils/decorations.dart';

class TEmailVerificationTextButton extends StatelessWidget {
  final EmailVerificationController controller;
  final VoidCallback onPressed;
  final String regularText;
  final String highLightedText;
  final RxBool enableResend;
  final RxInt count;

  const TEmailVerificationTextButton({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.regularText,
    required this.highLightedText,
    required this.enableResend,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        onPressed: enableResend == true.obs
            ? () {
                onPressed();
                controller.reset();
              }
            : null,
        style: TDecorations.textButtonDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$regularText ', style: Get.textTheme.bodySmall),
            Text('$highLightedText ', style: Get.textTheme.displaySmall),
            Text(count != 0.obs ? '${count}s' : '',
                style: Get.textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
