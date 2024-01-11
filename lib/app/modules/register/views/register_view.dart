import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/modules/register/views/register_widgets.dart';
import 'package:stellar/app/utils/decorations.dart';
import 'package:stellar/app/utils/theme.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar', style: Get.textTheme.titleMedium),
        centerTitle: true,
        leading: TAppTheme.backButtonIconTheme,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          TRegisterTextField(
            controller: controller.fullNameC,
            label: "Masukkan Nama Lengkap",
            icon: Icons.person_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          TRegisterTextField(
            controller: controller.phoneNumberC,
            label: "Masukkan Nomor Telepon",
            icon: Icons.phone_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          TRegisterTextField(
            controller: controller.emailC,
            label: "Masukkan Alamat Email",
            icon: Icons.email_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => TextField(
              controller: controller.passC,
              style: Get.textTheme.bodySmall,
              autocorrect: false,
              enableSuggestions: false,
              obscureText: controller.isPassObscured.value,
              decoration: TDecorations.passwordTextFieldDecoration(
                controller.onTogglePassObscure,
                controller.isPassObscured.value,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => controller.onRegister(authC),
                  child: const Text("Daftar"),
                ),
              ),
            ],
          ),
          TRegisterTextButton(
            onPressed: Get.back,
            regularText: "Sudah memiliki akun?",
            highLightedText: "Masuk!",
          )
        ],
      ),
    );
  }
}
