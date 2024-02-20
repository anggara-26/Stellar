import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/routes/app_pages.dart';
import 'package:stellar/app/utils/colors.dart';

class THomeDeviceList extends StatelessWidget {
  const THomeDeviceList({
    required this.deviceRef,
    super.key,
  });

  final Query Function() deviceRef;

  @override
  Widget build(BuildContext context) {
    LightController lightC = Get.find<LightController>();

    return FirebaseAnimatedList(
      query: deviceRef(),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
        Map data = snapshot.value as Map;
        data['key'] = snapshot.key;
        return THomeDeviceBox(
          onPressed: () {
            Get.toNamed(Routes.DEVICE_DETAIL, id: 2, arguments: data);
          },
          sqmIndex: (data['sqm index'] as int).toDouble(),
          categorizeIndex: lightC.categorizeIndex,
        );
      },
    );
  }
}

class THomeDeviceBox extends StatelessWidget {
  const THomeDeviceBox({
    required this.onPressed,
    required this.sqmIndex,
    required this.categorizeIndex,
    super.key,
  });

  final VoidCallback onPressed;
  final double sqmIndex;
  final String Function(num) categorizeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          fixedSize: const Size(0, 128),
          backgroundColor: TColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  size: 28,
                ),
                Container(
                  width: 28.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                    color: Color.lerp(
                      Colors.grey[300],
                      const Color.fromARGB(255, 51, 81, 138),
                      ((sqmIndex - 17.0) * 20.0) / 100.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      sqmIndex.toInt().toString(),
                      style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'sf-pro-display',
                        fontWeight: FontWeight.w700,
                        color: ((sqmIndex - 17.0) * 20.0) > 40.0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            Text(
              categorizeIndex(sqmIndex),
              style: const TextStyle(
                fontSize: 12.0,
                fontFamily: 'sf-pro-display',
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Smart Light',
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'sf-pro-display',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
