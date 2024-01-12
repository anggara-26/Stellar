import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/modules/login/views/login_widgets.dart';
import 'package:stellar/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    authC.checkEvery5Seconds();
    return Scaffold(
      appBar: AppBar(
        title: Text("Masuk", style: Get.textTheme.titleMedium),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          TLoginTextField(
            controller: controller,
            label: "Masukkan Alamat Email",
            icon: Icons.email_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          TLoginPasswordTextField(
            controller: controller,
            label: 'Masukkan Password',
            icon: Icons.password_outlined,
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Lupa Password?",
                textAlign: TextAlign.right,
                style: Get.textTheme.displaySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => controller.onLogin(authC),
                  child: const Text("Masuk"),
                ),
              ),
            ],
          ),
          TLoginTextButton(
            onPressed: () => Get.toNamed(Routes.REGISTER),
            regularText: "Belum pernah memiliki akun?",
            highLightedText: "Daftar!",
          ),
          const SizedBox(
            height: 24,
          ),
          const TLoginDivider(text: 'OR'),
          const SizedBox(
            height: 24,
          ),
          TLoginOutlinedButton(
            onPressed: () => controller.onLoginWithGoogle(authC),
            label: 'Sign in with Google',
            iconPath: 'assets/images/Google.png',
          ),
        ],
      ),
    );
  }
}
