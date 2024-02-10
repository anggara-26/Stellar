import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/utils/dialog.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> removeFavorite(id) {
    return firestore.collection('users').doc(auth.currentUser!.uid).update({
      'favorite sqm indexes': FieldValue.arrayRemove([id])
    });
  }

  void onLongPressedFavoriteCard(String id, String locationName) async {
    TRemoveAlertDialog.show(
      "Hapus dari Favorit",
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: 'Apakah Anda yakin ingin menghapus ',
                style: Get.textTheme.bodyMedium),
            TextSpan(
                text: locationName,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
                text: ' dari daftar favorit?', style: Get.textTheme.bodyMedium),
          ],
        ),
      ),
      Icons.delete_outline,
      onRemove: () async {
        try {
          await removeFavorite(id);
          Get.back();
          Get.snackbar(
            "Berhasil",
            "Berhasil menghapus $locationName dari daftar favorit",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } on FirebaseException catch (_) {
          Get.back();
          Get.snackbar(
            "Gagal",
            "Gagal menghapus $locationName dari daftar favorit",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
    );
  }
}
