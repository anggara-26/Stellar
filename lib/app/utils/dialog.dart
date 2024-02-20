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
                onPressed: () {
                  Get.back();
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
                style: Get.theme.elevatedButtonTheme.style!.copyWith(
                  minimumSize: MaterialStateProperty.all(const Size(183, 0)),
                ),
                child: Text(confirmText ?? "OK", textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TRemoveAlertDialog {
  static void show(String title, Widget Message, IconData icon,
      {required VoidCallback onRemove}) {
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
              Message,
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: Get.theme.elevatedButtonTheme.style!.copyWith(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey),
                        minimumSize:
                            MaterialStateProperty.all(const Size(0, 0)),
                      ),
                      child: const Text("Batal", textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onRemove();
                      },
                      child: const Text("Hapus", textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TUnderDevelopmentAlertDialog {
  static void show(String feature,
      {String? confirmText, VoidCallback? onConfirm}) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 58, 24, 40),
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
                child: const Icon(Icons.construction,
                    size: 52, color: TColors.primaryColor),
              ),
              const SizedBox(height: 40),
              Text(
                'Under Development',
                style: Get.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Fitur $feature sedang dalam pengembangan.',
                style: Get.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
                style: Get.theme.elevatedButtonTheme.style!.copyWith(
                  minimumSize: MaterialStateProperty.all(const Size(183, 0)),
                ),
                child: Text(confirmText ?? "OK", textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
