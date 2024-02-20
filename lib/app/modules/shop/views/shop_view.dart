import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/utils/app_bar.dart';

import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({super.key});
  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      appBar: TAppBar(authC: authC),
      body: const Center(
        child: Text(
          'Shop Screen is still under development.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
