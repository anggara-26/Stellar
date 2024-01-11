import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/routes/app_pages.dart';
import 'package:stellar/app/utils/dialog.dart';

class RegisterController extends GetxController {
  TextEditingController fullNameC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  RxBool isPassObscured = true.obs;

  void onTogglePassObscure() {
    isPassObscured.value = !isPassObscured.value;
  }

  void onRegister(AuthController controller) async {
    final response =
        await controller.register(fullNameC.text, emailC.text, passC.text);
    if (response[0] == 'success') {
      TAlertDialog.show(
        "Berhasil",
        "Akun Anda telah berhasil didaftarkan",
        Icons.check_outlined,
        confirmText: "Lanjut",
        onConfirm: () {
          Get.offNamed(Routes.EMAIL_VERIFICATION);
          controller.sendEmailVerification();
        },
      );
    } else if (response[0] == 'failed') {
      TAlertDialog.show(
        response[1],
        response[2],
        Icons.cancel_outlined,
        confirmText: "Kembali",
      );
    }
  }

  @override
  void onClose() {
    fullNameC.dispose();
    phoneNumberC.dispose();
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
