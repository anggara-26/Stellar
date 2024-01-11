import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/utils/colors.dart';

class TAlertDialog {
  static void show(String title, String message, IconData icon,
      {String? confirmText, VoidCallback? onConfirm}) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 58, 32, 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 112,
                height: 112,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F8FF),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 52, color: TColors.primaryColor),
              ),
              const SizedBox(height: 40),
              Text(
                title,
                style: Get.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: Get.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: Text(confirmText ?? "OK", textAlign: TextAlign.center),
                onPressed: () {
                  Get.back();
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
                style: Get.theme.elevatedButtonTheme.style!.copyWith(
                  minimumSize: MaterialStateProperty.all(const Size(183, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
