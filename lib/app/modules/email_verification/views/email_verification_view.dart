import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/modules/email_verification/views/email_verification_widgets.dart';
import 'package:stellar/app/utils/theme.dart';

import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TAppTheme.backButtonIconTheme,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verifikasi Email',
                style: Get.textTheme.titleLarge,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: 8.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Klik link verifkasi yang telah dikirim ke email ',
                        style: Get.textTheme.bodyMedium),
                    TextSpan(
                        text: authC.auth.currentUser?.email,
                        style: Get.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              TEmailVerificationTextButton(
                controller: controller,
                onPressed: authC.sendEmailVerification,
                regularText: 'Tidak menerima email? ',
                highLightedText: 'Resend',
                enableResend: controller.enableResend,
                count: controller.count,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
