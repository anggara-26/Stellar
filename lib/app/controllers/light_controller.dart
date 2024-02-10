import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';

class LightController extends GetxController {
  AuthController authC = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String categorizeIndex(num sqmIndex) {
    if (sqmIndex >= 21.75) {
      return 'Tempat yang sebenarnya gelap';
    } else if (sqmIndex >= 21.6) {
      return 'Tempat langit gelap yang sangat baik';
    } else if (sqmIndex >= 21.3) {
      return 'Langit pedesaan';
    } else if (sqmIndex >= 20.8) {
      return 'Langit pedesaaan yang lebih terang';
    } else if (sqmIndex >= 20.3) {
      return 'Langit semi-perkotaan/transisi';
    } else if (sqmIndex >= 19.25) {
      return 'Langit perkotaan pinggiran';
    } else if (sqmIndex >= 18.5) {
      return 'Langit perkotaan yang cerah';
    } else if (sqmIndex >= 18.0) {
      return 'Transisi perkotaan/pedesaan';
    } else {
      return 'Langit pusat kota';
    }
  }

  double getPercentageScale(num sqmIndex) {
    final percentage = (100 - ((sqmIndex - 17.0) * 20.0)) / 100.0;
    if (percentage < 0.0) {
      return 0.0;
    } else if (percentage > 1.0) {
      return 1.0;
    } else {
      return percentage;
    }
  }

  Future<List<Map<String, dynamic>>> loadSqmIndexes() async {
    QuerySnapshot<Map<String, dynamic>> sqmIndexes =
        await firestore.collection('sqm index').get();
    List<Map<String, dynamic>> mappedSqmIndexes = await Future.wait(
      sqmIndexes.docs.map(
        (element) async {
          QuerySnapshot<Map<String, dynamic>> sqmList = await firestore
              .collection('sqm index')
              .doc(element.id)
              .collection('sqm list')
              .get();
          return {
            'sqm list': sqmList.docs
                .map((e) => {'reference': '${element.id}/${e.id}', ...e.data()})
                .toList(),
            'city': element['city'],
          };
        },
      ),
    );
    return mappedSqmIndexes;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamFavoriteSqmIndex(
      String id) {
    return firestore
        .collection('sqm index')
        .doc(id.split('/')[0])
        .collection('sqm list')
        .doc(id.split('/')[1])
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getFavoriteSqmIndexList() {
    return firestore
        .collection('users')
        .doc(authC.auth.currentUser?.uid)
        .snapshots();
  }
}
