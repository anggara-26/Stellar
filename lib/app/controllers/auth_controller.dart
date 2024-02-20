import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:stellar/app/routes/app_pages.dart';

class AuthController extends GetxController {
  Timer? checkTimer;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  Future login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return [
        'failed',
        'Ups! Gagal Masuk',
        'Alamat email dan password tidak boleh kosong'
      ];
    }
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user!.emailVerified) {
        Get.offAllNamed(Routes.LANDING);
        return null;
      } else {
        Get.toNamed(Routes.EMAIL_VERIFICATION);
        sendEmailVerification();
        return [
          'success',
          'Silahkan verifikasi email anda',
          'Kami telah mengirimkan email verifikasi ke alamat email anda'
        ];
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return [
          'failed',
          'Ups! Gagal Masuk',
          'Periksa kembali alamat email dan password anda'
        ];
      } else {
        return [
          'failed',
          'Terjadi Kesalahan',
          'Periksa kembali isian anda dan tunggu beberapa saat'
        ];
      }
    }
  }

  Future loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      final User? user = auth.currentUser;
      await firestore.doc('users/${user!.uid}').get().then((doc) async {
        print(doc.data());
        if (!doc.exists) {
          print('jalan');
          await firestore.collection('users').doc(user.uid).set(
            {
              'display name': user.displayName,
              'email': user.email,
              'phone number': user.phoneNumber,
              'favorite sqm indexes': [],
            },
          );
        }
      });
      Get.offAllNamed(Routes.LANDING);
      return null;
    } catch (e) {
      return [
        'failed',
        'Terjadi Kesalahan',
        'Silahkan tunggu beberapa saat dan coba kembali'
      ];
    }
  }

  Future register(String fullName, String email, String phoneNumberC,
      String password) async {
    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      return [
        'failed',
        'Ups! Gagal Mendaftar',
        'Nama lengkap, alamat email, dan password tidak boleh kosong'
      ];
    }
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? user = credential.user;
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'display name': fullName,
        'email': email,
        'phone number': phoneNumberC,
        'favorite sqm indexes': [],
      });
      user.updateDisplayName(fullName);
      if (user.emailVerified) {
        Get.offAllNamed(Routes.LANDING);
        return null;
      } else {
        return ['success', 'Berhasil', 'Akun Anda telah berhasil didaftarkan'];
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return [
          'failed',
          'Ups! Gagal Mendaftar',
          'Password anda terlalu lemah'
        ];
      } else if (e.code == 'email-already-in-use') {
        return [
          'failed',
          'Ups! Gagal Mendaftar',
          'Akun dengan email $email sudah terdaftar'
        ];
      }
    } catch (_) {
      return [
        'failed',
        'Terjadi Kesalahan',
        'Periksa kembali isian anda dan tunggu beberapa saat'
      ];
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void sendEmailVerification() async {
    User? user = auth.currentUser;
    await user!.sendEmailVerification();
  }

  void checkEvery5Seconds() {
    checkTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      print(timer.tick);
      await auth.currentUser?.reload();
      if (auth.currentUser!.emailVerified) {
        timer.cancel();
        Get.offAllNamed(Routes.LANDING);
      }
    });
  }

  @override
  void onClose() {
    checkTimer?.cancel();
    super.onClose();
  }
}
