import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stellar/app/utils/colors.dart';

class THomeDisplayName extends StatelessWidget {
  const THomeDisplayName(this.name, {super.key});

  final String? name;

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
  const THomeSectionTitle({required this.title, super.key});

  final String title;

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
  const THomeBanner({
    required this.onPressed,
    required this.backgroundImage,
    required this.icon,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final ImageProvider backgroundImage;
  final IconData icon;
  final String text;

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
  const THomeTerdekat({
    required this.data,
    required this.categorizeIndex,
    required this.getPercentageScale,
    super.key,
  });

  final Map<String, dynamic> data;
  final String Function(num) categorizeIndex;
  final double Function(num) getPercentageScale;

  @override
  Widget build(BuildContext context) {
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
                      percent: getPercentageScale(data['sqmIndex']),
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
                    categorizeIndex(data['sqmIndex']),
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

class THomeFavoriteList extends StatelessWidget {
  const THomeFavoriteList({
    required this.onLongPressCard,
    required this.getUserFavoriteSqmIndexList,
    required this.streamFavoriteSqmIndex,
    required this.loadSqmIndexes,
    required this.categorizeIndex,
    required this.getPercentageScale,
    super.key,
  });

  final void Function(String, String) onLongPressCard;
  final Stream<DocumentSnapshot<Map<String, dynamic>>> Function()
      getUserFavoriteSqmIndexList;
  final Stream<DocumentSnapshot<Map<String, dynamic>>> Function(String)
      streamFavoriteSqmIndex;
  final Future<List<Map<String, dynamic>>> Function() loadSqmIndexes;
  final String Function(num) categorizeIndex;
  final double Function(num) getPercentageScale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: StreamBuilder<DocumentSnapshot>(
        stream: getUserFavoriteSqmIndexList(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> userSnapshot) {
          final favoriteIds = userSnapshot.data?['favorite sqm indexes'] ?? [];
          print(favoriteIds);
          if (userSnapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (userSnapshot.connectionState == ConnectionState.active) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: favoriteIds.length + 1,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              itemBuilder: (context, index) {
                if (index < favoriteIds.length) {
                  return StreamBuilder<dynamic>(
                    stream: streamFavoriteSqmIndex(favoriteIds[index]),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<dynamic> snapshot,
                    ) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.active) {
                        final favoriteData = snapshot.data ?? {};
                        return THomeFavoriteBox(
                          onLongPressed: onLongPressCard,
                          categorizeIndex: categorizeIndex,
                          id: favoriteIds[index],
                          sqmIndex: favoriteData['sqm index'],
                          district: favoriteData['district'],
                          locationName: favoriteData['location name'],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                } else {
                  return THomeAddFavoriteBox(
                    onPressed: () => showAddFavoriteModal(context, favoriteIds,
                        loadSqmIndexes, getPercentageScale),
                  );
                }
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class THomeFavoriteBox extends StatelessWidget {
  const THomeFavoriteBox({
    required this.onLongPressed,
    required this.categorizeIndex,
    required this.id,
    required this.sqmIndex,
    required this.district,
    required this.locationName,
    super.key,
  });

  final void Function(String, String) onLongPressed;
  final String Function(num) categorizeIndex;
  final String id;
  final num sqmIndex;
  final String district;
  final String locationName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: ElevatedButton(
        onPressed: () {},
        onLongPress: () => onLongPressed(id, locationName),
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
                        color: ((sqmIndex - 17.0) * 20.0) > 10.0
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
                        color: ((sqmIndex - 17.0) * 20.0) > 10.0
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
              categorizeIndex(sqmIndex),
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'sf-pro-display',
                fontWeight: FontWeight.w700,
                color: ((sqmIndex - 17.0) * 20.0) > 10.0
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '$locationName, $district',
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'sf-pro-display',
                color: ((sqmIndex - 17.0) * 20.0) > 10.0
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
  const THomeAddFavoriteBox({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

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

Future<dynamic> showAddFavoriteModal(
  BuildContext context,
  List<dynamic> userFavoriteIds,
  Future<List<Map<String, dynamic>>> Function() sqmIndexes,
  double Function(num) getPercentageScale,
) {
  return showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 0.9,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40.0),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        snap: true,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Padding(
              // width: Get.size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 8.0,
                          ),
                        ),
                        child: const Text(
                          'Tutup',
                          style: TextStyle(
                            fontSize: 12.0,
                            letterSpacing: 0.8,
                            fontFamily: 'sf-pro-display',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => Get.back(),
                      )
                    ],
                  ),
                  const Text(
                    'Tambah ke Favorit',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'sf-pro-display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  const TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                        borderSide: BorderSide(
                          color: TColors.primaryColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                      labelText: 'Cari kecamatan atau kota',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.search_outlined,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: sqmIndexes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        var sqmIndexesList = snapshot.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: sqmIndexesList.length,
                          padding: const EdgeInsets.only(top: 10.0),
                          itemBuilder: (context, i) {
                            return THomeFavoriteModalSqmColumnCity(
                              sqmIndexData: sqmIndexesList[i],
                              userFavoriteIds: userFavoriteIds,
                              getPercentageScale: getPercentageScale,
                            );
                          },
                        );
                      }
                      return const Padding(
                        padding: EdgeInsets.only(top: 144.0),
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class THomeFavoriteModalSqmColumnCity extends StatelessWidget {
  const THomeFavoriteModalSqmColumnCity({
    super.key,
    required this.sqmIndexData,
    required this.userFavoriteIds,
    required this.getPercentageScale,
  });

  final Map<String, dynamic> sqmIndexData;
  final List<dynamic> userFavoriteIds;
  final double Function(num) getPercentageScale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sqmIndexData['city'],
            style: const TextStyle(
              fontSize: 14.0,
              height: 2.5,
              fontFamily: 'sf-pro-display',
              fontWeight: FontWeight.w700,
              color: TColors.primaryColor,
            ),
          ),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sqmIndexData['sqm list'].length,
            itemBuilder: (context, j) {
              return Column(
                children: [
                  THomeFavoriteModalSqmRowLocation(
                    reference: sqmIndexData['sqm list'][j]['reference'],
                    userFavoriteIds: userFavoriteIds,
                    locationName: sqmIndexData['sqm list'][j]['location name'],
                    district: sqmIndexData['sqm list'][j]['district'],
                    sqmIndex: sqmIndexData['sqm list'][j]['sqm index'],
                    getPercentageScale: getPercentageScale,
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class THomeFavoriteModalSqmRowLocation extends StatelessWidget {
  const THomeFavoriteModalSqmRowLocation({
    super.key,
    required this.reference,
    required this.userFavoriteIds,
    required this.locationName,
    required this.district,
    required this.sqmIndex,
    required this.getPercentageScale,
  });

  final String reference;
  final List<dynamic> userFavoriteIds;
  final String locationName;
  final String district;
  final double sqmIndex;
  final double Function(num) getPercentageScale;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locationName,
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'sf-pro-display',
                fontWeight: FontWeight.w700,
                color: TColors.primaryColor,
              ),
            ),
            Text(
              '$locationName, $district',
              style: const TextStyle(
                fontSize: 12.0,
                fontFamily: 'sf-pro-display',
                color: TColors.primaryColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            CircularPercentIndicator(
              radius: 28.0,
              lineWidth: 5.0,
              animation: true,
              percent: getPercentageScale(sqmIndex),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: TColors.primaryColor,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    sqmIndex.toString(),
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
            const SizedBox(width: 10.0),
            IconButton(
                onPressed: () {
                  setState() {}
                  ;
                },
                icon: Icon(
                  userFavoriteIds.contains(reference)
                      ? Icons.favorite_outlined
                      : Icons.favorite_border_outlined,
                  color: TColors.primaryColor,
                  size: 28.0,
                ))
          ],
        )
      ],
    );
  }
}

class THomeDeviceList extends StatelessWidget {
  const THomeDeviceList({
    required this.data,
    required this.categorizeIndex,
    super.key,
  });

  final List<Map<String, dynamic>> data;
  final String Function(num) categorizeIndex;

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
              categorizeIndex: categorizeIndex,
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

class THomeHighlightList extends StatelessWidget {
  const THomeHighlightList(this.data, {super.key});

  final List<Map<String, String>> data;

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

class THomeHighlighBox extends StatelessWidget {
  const THomeHighlighBox({
    required this.onPressed,
    required this.backgroundImage,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final String backgroundImage;
  final String text;

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
