import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/utils/colors.dart';

class THomeDisplayName extends StatelessWidget {
  final String? name;
  const THomeDisplayName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        name != null ? 'Halo, $name!' : 'Halo!',
        style: Get.textTheme.titleSmall,
      ),
    );
  }
}

class THomeSectionTitle extends StatelessWidget {
  final String title;
  const THomeSectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12.0,
          fontFamily: 'sf-pro-display',
          fontWeight: FontWeight.w700,
          color: Color(0xFF999999),
        ),
      ),
    );
  }
}

class THomeBanner extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider backgroundImage;
  final IconData icon;
  final String text;
  const THomeBanner({
    required this.onPressed,
    required this.backgroundImage,
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 14.0,
            ),
            fixedSize: const Size(double.infinity, double.infinity),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          child: Row(children: [
            Icon(
              icon,
              size: 20.0,
              color: TColors.primaryColor,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'sf-pro-display',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class THomeTerdekat extends StatelessWidget {
  final Map<String, dynamic> data;
  const THomeTerdekat(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LightController();
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
                      percent: controller.getPercentageScale(data['sqmIndex']),
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
                    controller.categorizeIndex(data['sqmIndex']),
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

class THomeFavoriteBox extends StatelessWidget {
  final VoidCallback onPressed;
  final double sqmIndex;
  final String city;
  final String subdistrict;

  const THomeFavoriteBox({
    required this.onPressed,
    required this.sqmIndex,
    required this.city,
    required this.subdistrict,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LightController();
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          fixedSize: const Size(176, 0),
          backgroundColor: Color.lerp(
            Colors.grey[300],
            TColors.primaryColor,
            ((sqmIndex - 17.0) * 20.0) / 100.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: sqmIndex.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'sf-pro-display',
                        fontWeight: FontWeight.w700,
                        color: ((sqmIndex - 17.0) * 20.0) > 30.0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' sqm',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'sf-pro-display',
                        fontWeight: FontWeight.w700,
                        color: ((sqmIndex - 17.0) * 20.0) > 30.0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              controller.categorizeIndex(sqmIndex),
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'sf-pro-display',
                fontWeight: FontWeight.w700,
                color: ((sqmIndex - 17.0) * 20.0) > 30.0
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '$subdistrict, $city',
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'sf-pro-display',
                color: ((sqmIndex - 17.0) * 20.0) > 30.0
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class THomeAddFavoriteBox extends StatelessWidget {
  final VoidCallback onPressed;
  const THomeAddFavoriteBox({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15.0),
          fixedSize: const Size(176, 0),
          backgroundColor: const Color(0xFFB0B0B0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.star_outline_rounded,
                color: TColors.primaryColor,
                size: 24.0,
              ),
            ),
            Text(
              'Klik untuk\ntambah favorit',
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'sf-pro-display',
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class THomeFavoriteList extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const THomeFavoriteList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length + 1,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        itemBuilder: (context, index) {
          if (index < data.length) {
            return THomeFavoriteBox(
              onPressed: () {},
              sqmIndex: data[index]['sqmIndex'],
              city: data[index]['city'],
              subdistrict: data[index]['subdistrict'],
            );
          } else {
            return THomeAddFavoriteBox(onPressed: () {});
          }
        },
      ),
    );
  }
}

class THomeDeviceBox extends StatelessWidget {
  final VoidCallback onPressed;
  final double sqmIndex;

  const THomeDeviceBox({
    required this.onPressed,
    required this.sqmIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LightController();
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          fixedSize: const Size(192, 0),
          backgroundColor: TColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
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
              controller.categorizeIndex(sqmIndex),
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

class THomeDeviceList extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const THomeDeviceList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length + 1,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        itemBuilder: (context, index) {
          if (index < data.length) {
            return THomeDeviceBox(
              onPressed: () {},
              sqmIndex: data[index]['sqmIndex'],
            );
          } else {
            return IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
              iconSize: 32.0,
            );
          }
        },
      ),
    );
  }
}

class THomeHighlighBox extends StatelessWidget {
  final VoidCallback onPressed;
  final String backgroundImage;
  final String text;
  const THomeHighlighBox({
    required this.onPressed,
    required this.backgroundImage,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 14.0,
          ),
          fixedSize: const Size(double.infinity, double.infinity),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'sf-pro-display',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_outlined,
              size: 32.0,
              color: TColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class THomeHighlightList extends StatelessWidget {
  final List<Map<String, String>> data;
  const THomeHighlightList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      itemBuilder: (context, index) {
        return THomeHighlighBox(
          onPressed: () {},
          backgroundImage: data[index]['imageUrl'] ?? '',
          text: data[index]['text'] ?? '',
        );
      },
    );
  }
}
