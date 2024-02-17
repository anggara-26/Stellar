import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/modules/home/views/home_widgets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  final lightC = Get.put(LightController());
  final List<Map<String, dynamic>> dummyFavoriteData = [
    {'sqmIndex': 17.0, 'city': 'Tangerang Selatan', 'subdistrict': 'Serpong'},
    {'sqmIndex': 18.60, 'city': 'Depok', 'subdistrict': 'Margonda'},
    {'sqmIndex': 21.60, 'city': 'Harapan Indah', 'subdistrict': 'Taman Sari'},
  ];
  // final Map<String, dynamic> dummyTerdekatData = {
  //   'sqmIndex': 18.3,
  //   'city': 'Jakarta',
  //   'subdistrict': 'Kalideres'
  // };
  final List<Map<String, dynamic>> dummyDeviceData = [
    {'sqmIndex': 19.0},
  ];
  final List<Map<String, String>> dummyHighlightData = [
    {
      'imageUrl': 'assets/images/highlight_1.png',
      'text': 'Petunjuk Fitur Aplikasi Stellar'
    },
    {
      'imageUrl': 'assets/images/highlight_2.png',
      'text': 'Pengertian dan dampak polusi cahaya'
    }
  ];

  @override
  void initState() {
    lightC.startListening();
  }

  @override
  void dispose() {
    lightC.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    lightC.startListening();
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
          Obx(
            () => THomeTerdekat(
              data: {
                'sqmIndex': lightC.sqmIndex.value,
                'city': 'Jakarta',
                'subdistrict': 'Kalideres'
              },
              categorizeIndex: lightC.categorizeIndex,
              getPercentageScale: lightC.getPercentageScale,
            ),
          ),
          const SizedBox(height: 12.0),
          const THomeSectionTitle(title: 'Favorit'),
          const SizedBox(height: 12.0),
          THomeFavoriteList(
            onLongPressCard: controller.onLongPressedFavoriteCard,
            getUserFavoriteSqmIndexList: lightC.getFavoriteSqmIndexList,
            streamFavoriteSqmIndex: lightC.streamFavoriteSqmIndex,
            loadSqmIndexes: lightC.loadSqmIndexes,
            categorizeIndex: lightC.categorizeIndex,
            getPercentageScale: lightC.getPercentageScale,
          ),
          const SizedBox(height: 12.0),
          const THomeSectionTitle(title: 'Perangkat Saya'),
          const SizedBox(height: 12.0),
          THomeDeviceList(
            data: dummyDeviceData,
            categorizeIndex: lightC.categorizeIndex,
          ),
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
