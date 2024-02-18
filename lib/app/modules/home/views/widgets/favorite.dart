import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stellar/app/controllers/light_controller.dart';
import 'package:stellar/app/modules/home/controllers/home_controller.dart';
import 'package:stellar/app/utils/colors.dart';

class THomeFavoriteList extends StatelessWidget {
  const THomeFavoriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LightController lightC = Get.find<LightController>();
    return SizedBox(
      height: 112,
      child: StreamBuilder<DocumentSnapshot>(
        stream: lightC.getFavoriteSqmIndexList(),
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
                    stream: lightC.streamFavoriteSqmIndex(favoriteIds[index]),
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
                    onPressed: () => showAddFavoriteModal(context, favoriteIds),
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
    required this.id,
    required this.sqmIndex,
    required this.district,
    required this.locationName,
    super.key,
  });

  final String id;
  final num sqmIndex;
  final String district;
  final String locationName;

  @override
  Widget build(BuildContext context) {
    HomeController homeC = Get.find<HomeController>();
    LightController lightC = Get.find<LightController>();
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: ElevatedButton(
        onPressed: () {},
        onLongPress: () => homeC.onLongPressedFavoriteCard(id, locationName),
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
              lightC.categorizeIndex(sqmIndex),
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
) {
  LightController lightC = Get.find<LightController>();
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
                    future: lightC.loadSqmIndexes(),
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
  });

  final Map<String, dynamic> sqmIndexData;
  final List<dynamic> userFavoriteIds;

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
  });

  final String reference;
  final List<dynamic> userFavoriteIds;
  final String locationName;
  final String district;
  final double sqmIndex;

  @override
  Widget build(BuildContext context) {
    LightController lightC = Get.find<LightController>();
    return StreamBuilder<DocumentSnapshot>(
      stream: lightC.getFavoriteSqmIndexList(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.active) {
          final snapshotData = snapshot.data?['favorite sqm indexes'] ?? [];
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
                    percent: lightC.getPercentageScale(sqmIndex),
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
                  snapshotData.contains(reference)
                      ? IconButton(
                          onPressed: () {
                            lightC.removeFavoriteSqmIndex(reference);
                          },
                          icon: const Icon(
                            Icons.favorite_outlined,
                            color: TColors.primaryColor,
                            size: 28.0,
                          ))
                      : IconButton(
                          onPressed: () {
                            lightC.addFavoriteSqmIndex(reference);
                          },
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: TColors.primaryColor,
                            size: 28.0,
                          ))
                ],
              )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
