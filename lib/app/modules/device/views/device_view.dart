import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/utils/app_bar.dart';
import 'package:stellar/app/utils/colors.dart';
import 'package:stellar/app/controllers/device_controller.dart'
    as globalDeviceController;
import 'package:stellar/app/utils/dialog.dart';

import './device_widets.dart';

class DeviceView extends StatelessWidget {
  const DeviceView({super.key});
  @override
  Widget build(BuildContext context) {
    final deviceC = Get.find<globalDeviceController.DeviceController>();
    final authC = Get.find<AuthController>();
    return Scaffold(
      appBar: TAppBar(authC: authC),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const SizedBox(height: 18.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              'Perangkat Saya',
              style: TextStyle(
                fontFamily: 'sf-pro-display',
                color: TColors.textBodyColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          THomeDeviceList(deviceRef: deviceC.deviceRef),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: ElevatedButton(
              onPressed: () {
                TUnderDevelopmentAlertDialog.show('Tambah Perangkat');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: TColors.primaryColor,
                    size: 28.0,
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    'Tambah Perangkat',
                    style: TextStyle(
                      fontFamily: 'sf-pro-display',
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
