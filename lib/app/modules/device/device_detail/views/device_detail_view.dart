import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/device_controller.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/utils/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../controllers/device_detail_controller.dart';

class DeviceDetailView extends GetView<DeviceDetailController> {
  @override
  Widget build(BuildContext context) {
    LightController lightC = Get.find<LightController>();
    DeviceController deviceC = Get.find<DeviceController>();
    controller.deviceData = ModalRoute.of(context)!.settings.arguments ?? {};
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Stellar Bulb',
              style: TextStyle(
                fontFamily: 'sf-pro-display',
                color: TColors.textBodyColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Connected to Monitor',
              style: TextStyle(
                fontFamily: 'sf-pro-display',
                color: Color(0xFF999999),
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: deviceC
              .deviceDetailRef((controller.deviceData as Map)['key'])
              .onValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              Map dataValues =
                  (snapshot.data! as DatabaseEvent).snapshot.value as Map;
              return Column(
                children: [
                  const SizedBox(height: 32.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Stellar Bulb',
                              style: TextStyle(
                                fontFamily: 'sf-pro-display',
                                color: TColors.textBodyColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Outdoor',
                              style: TextStyle(
                                fontFamily: 'sf-pro-display',
                                color: Color(0xFF999999),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.lightbulb_outline,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 12.0,
                    endIndent: 12.0,
                    color: TColors.primaryColor,
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.0,
                          child: Text(
                            lightC.categorizeIndex(18),
                            style: const TextStyle(
                                fontFamily: 'sf-pro-display',
                                color: TColors.primaryColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 28.0,
                          lineWidth: 5.0,
                          animation: true,
                          percent: lightC.getPercentageScale(18),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: TColors.primaryColor,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                18.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'sf-pro-display',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF151522),
                                  height: 0.9,
                                ),
                              ),
                              const Text(
                                'SQM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 8.0,
                                  fontFamily: 'sf-pro-display',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1E1E1E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          backgroundColor: dataValues['autoIntensity']
                              ? TColors.primaryColor
                              : const Color(0xFFA6A6A6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Otomatis',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'sf-pro-display',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          backgroundColor: dataValues['autoIntensity']
                              ? const Color(0xFFA6A6A6)
                              : TColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Manual',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'sf-pro-display',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 36.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (dataValues['on']) {
                          deviceC.turnOffDevice(
                              (controller.deviceData as Map)['key']);
                        } else {
                          deviceC.turnOnDevice(
                              (controller.deviceData as Map)['key']);
                        }
                      },
                      child:
                          Text('${dataValues['on'] ? 'Matikan' : 'Hidupkan'}'),
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
