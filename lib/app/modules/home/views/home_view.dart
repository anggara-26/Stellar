import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/controllers/device_controller.dart';
import 'package:stellar/app/utils/app_bar.dart';
import 'package:stellar/app/utils/dialog.dart';

import './home_widgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final lightC = Get.find<LightController>();
    final homeC = Get.find<HomeController>();
    final deviceC = Get.find<DeviceController>();

    final List<Map<String, dynamic>> dummyHighlightData = [
      {
        'imageUrl': 'assets/images/highlight_1.png',
        'text': 'Petunjuk Fitur Aplikasi Stellar',
        'onPressed': () {
          TUnderDevelopmentAlertDialog.show('Petunjuk Fitur Aplikasi Stellar');
        }
      },
      {
        'imageUrl': 'assets/images/highlight_2.png',
        'text': 'Pengertian dan dampak polusi cahaya',
        'onPressed': () {
          TUnderDevelopmentAlertDialog.show(
              'Pengertian dan dampak polusi cahaya');
        }
      }
    ];

    return Scaffold(
      appBar: TAppBar(authC: authC),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          THomeDisplayName(authC.auth.currentUser?.displayName?.split(' ')[0]),
          const SizedBox(height: 20.0),
          THomeBanner(
            onPressed: () {
              TUnderDevelopmentAlertDialog.show('Alert Polusi Cahaya');
            },
            backgroundImage: const AssetImage('assets/images/home_banner.png'),
            icon: Icons.add_circle_outline,
            text: 'Dapatkan alert polusi cahaya di lokasi anda',
          ),
          const SizedBox(height: 24.0),
          const THomeSectionTitle(title: 'Terdekat'),
          const SizedBox(height: 12.0),
          Obx(
            () => THomeTerdekat(
              data: {
                'sqmIndex': lightC.sqmIndex.value,
                'city': 'Jakarta',
                'subdistrict': 'Kalideres'
              },
            ),
          ),
          const SizedBox(height: 12.0),
          const THomeSectionTitle(title: 'Favorit'),
          const SizedBox(height: 12.0),
          const THomeFavoriteList(),
          const SizedBox(height: 12.0),
          const THomeSectionTitle(title: 'Perangkat Saya'),
          const SizedBox(height: 12.0),
          THomeDeviceList(deviceRef: deviceC.deviceRef),
          const SizedBox(height: 12.0),
          const THomeSectionTitle(title: 'Highlight'),
          const SizedBox(height: 12.0),
          THomeHighlightList(dummyHighlightData),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
