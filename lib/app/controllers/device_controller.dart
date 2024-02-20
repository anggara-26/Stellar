import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class DeviceController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseDatabase rtdb = FirebaseDatabase.instanceFor(
    app: Firebase.app('Stellar'),
    databaseURL:
        'https://kreasi-anak-seni-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  Query deviceRef() =>
      rtdb.ref().child('/users/${auth.currentUser!.uid}/devices');

  Query deviceDetailRef(String key) =>
      rtdb.ref().child('/users/${auth.currentUser!.uid}/devices/$key');

  void turnOffDevice(String key) {
    rtdb
        .ref()
        .child('/users/${auth.currentUser!.uid}/devices/$key')
        .update({'on': false});
  }

  void turnOnDevice(String key) {
    rtdb
        .ref()
        .child('/users/${auth.currentUser!.uid}/devices/$key')
        .update({'on': true});
  }
}
