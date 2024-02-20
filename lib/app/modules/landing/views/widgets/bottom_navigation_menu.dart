import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/modules/landing/controllers/landing_controller.dart';
import 'package:stellar/app/utils/colors.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({required this.controller, super.key});

  final LandingController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: controller.changeTabIndex,
        currentIndex: controller.tabIndex.value,
        selectedItemColor: TColors.primaryColor,
        unselectedItemColor: const Color(0xFFB0B0B0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.lightbulb),
            icon: Icon(Icons.lightbulb_outline),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.menu_book),
            icon: Icon(Icons.menu_book_outlined),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.shopping_bag),
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}
