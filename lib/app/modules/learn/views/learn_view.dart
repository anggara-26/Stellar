import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/utils/app_bar.dart';

import '../controllers/learn_controller.dart';

class LearnView extends GetView<LearnController> {
  const LearnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      appBar: TAppBar(authC: authC),
      body: const Center(
        child: Text(
          'Learn Screen is still under development.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
