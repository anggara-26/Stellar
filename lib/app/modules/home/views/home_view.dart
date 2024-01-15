import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/modules/home/views/home_widgets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  final List<Map<String, dynamic>> dummyFavoriteData = [
    {'sqmIndex': 18.48, 'city': 'Tangerang Selatan', 'subdistrict': 'Serpong'},
    {'sqmIndex': 18.60, 'city': 'Depok', 'subdistrict': 'Margonda'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stellar', style: Get.textTheme.titleSmall),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          THomeDisplayName(authC.auth.currentUser?.displayName?.split(' ')[0]),
          const SizedBox(height: 20.0),
          THomeBanner(
            onPressed: () {},
            backgroundImage: const AssetImage('assets/images/home_banner.png'),
            icon: Icons.add_circle_outline,
            text: 'Dapatkan alert polusi cahaya di lokasi anda',
          ),
          const SizedBox(height: 24.0),
          const THomeSectionTitle(title: 'Terdekat'),
          const SizedBox(height: 12.0),
          THomeTerdekat(
              sqmIndex: 17.95, city: 'Jakarta', subdistrict: 'Kalideres'),
          const SizedBox(height: 12.0),
          const THomeSectionTitle(title: 'Favorit'),
          const SizedBox(height: 12.0),
          THomeFavoriteList(dummyFavoriteData),
          const SizedBox(height: 12.0),
          const THomeSectionTitle(title: 'Perangkat Saya'),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
