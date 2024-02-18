import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/utils/colors.dart';

class THomeTerdekat extends StatelessWidget {
  const THomeTerdekat({
    required this.data,
    super.key,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    LightController lightC = Get.find<LightController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0x3DA6A6A6),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          height: 96,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 116,
                child: OverflowBox(
                  alignment: Alignment.centerLeft,
                  maxHeight: 116,
                  maxWidth: 116,
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircularPercentIndicator(
                      radius: 44.0,
                      lineWidth: 8.0,
                      animation: true,
                      percent: lightC.getPercentageScale(data['sqmIndex']),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: const Color(0xFF94959A),
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data['sqmIndex'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
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
                              fontSize: 10.0,
                              fontFamily: 'sf-pro-display',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1E1E1E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['city'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'sf-pro-display',
                      color: Color(0xFF151522),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.my_location_outlined,
                        size: 10.0,
                        color: TColors.primaryColor,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '${data['subdistrict']}, ${data['city']}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'sf-pro-display',
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    lightC.categorizeIndex(data['sqmIndex']),
                    style: const TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'sf-pro-display',
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: 24.0,
                height: 24.0,
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.favorite_outline,
                    size: 24.0,
                  ),
                  // iconSize: 24.0,
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}
