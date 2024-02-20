import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/controllers/device_controller.dart';
import 'package:stellar/app/modules/device/bindings/device_binding.dart';
import 'package:stellar/app/modules/device/device_detail/bindings/device_detail_binding.dart';
import 'package:stellar/app/modules/device/device_detail/views/device_detail_view.dart';
import 'package:stellar/app/modules/device/views/device_view.dart';
import 'package:stellar/app/modules/home/bindings/home_binding.dart';
import 'package:stellar/app/modules/home/controllers/home_controller.dart';
import 'package:stellar/app/modules/home/views/home_view.dart';
import 'package:stellar/app/modules/learn/bindings/learn_binding.dart';
import 'package:stellar/app/modules/learn/views/learn_view.dart';
import 'package:stellar/app/modules/shop/bindings/shop_binding.dart';
import 'package:stellar/app/modules/shop/views/shop_view.dart';
import 'package:stellar/app/routes/app_pages.dart';

import './landing_widgets.dart';
import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  final lightC = Get.put(LightController());
  final homeC = Get.put(HomeController());
  final deviceC = Get.put(DeviceController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingController(), permanent: true);
    return Scaffold(
      bottomNavigationBar: BottomNavigationMenu(controller: controller),
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            Navigator(
              key: Get.nestedKey(1),
              initialRoute: Routes.HOME,
              onGenerateRoute: (settings) {
                return GetPageRoute(
                  settings: settings,
                  page: () => const HomeView(),
                  binding: HomeBinding(),
                );
              },
            ),
            NavigatorPopHandler(
              onPop: () => Get.nestedKey(2)!.currentState!.pop(),
              child: Navigator(
                key: Get.nestedKey(2),
                initialRoute: Routes.DEVICE,
                onGenerateRoute: ((settings) {
                  if (settings.name == Routes.DEVICE) {
                    return GetPageRoute(
                      settings: settings,
                      page: () => const DeviceView(),
                      binding: DeviceBinding(),
                    );
                  } else if (settings.name == Routes.DEVICE_DETAIL) {
                    return GetPageRoute(
                      settings: settings,
                      page: () => DeviceDetailView(),
                      binding: DeviceDetailBinding(),
                    );
                  }
                }),
              ),
            ),
            Navigator(
              key: Get.nestedKey(3),
              initialRoute: Routes.LEARN,
              onGenerateRoute: (settings) {
                return GetPageRoute(
                  settings: settings,
                  page: () => const LearnView(),
                  binding: LearnBinding(),
                );
              },
            ),
            Navigator(
              key: Get.nestedKey(4),
              initialRoute: Routes.SHOP,
              onGenerateRoute: (settings) {
                return GetPageRoute(
                  settings: settings,
                  page: () => const ShopView(),
                  binding: ShopBinding(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
