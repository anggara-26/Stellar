import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/utils/dialog.dart';

class LoginController extends GetxController {
  RxString emailC = "".obs;
  RxString passC = "".obs;
  RxBool isPassObscured = true.obs;

  void onChangedEmail(String value) {
    emailC.value = value;
  }

  void onChangePassword(String value) {
    passC.value = value;
  }

  void onTogglePassObscure() {
    isPassObscured.value = !isPassObscured.value;
  }

  void onLogin(AuthController controller) async {
    final response = await controller.login(emailC.value, passC.value);
    if (response != null) {
      TAlertDialog.show(
        response[1],
        response[2],
        response[0] == 'success' ? Icons.check_outlined : Icons.cancel_outlined,
        confirmText: "Kembali",
      );
    }
  }

  bool get isEmailFieldEmpty => emailC.value.isEmpty;
  bool get isPasswordFieldEmpty => passC.value.isEmpty;
}
