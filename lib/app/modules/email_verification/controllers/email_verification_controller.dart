import 'dart:async';

import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  Timer? timer;
  RxBool enableResend = false.obs;
  RxInt count = 60.obs;

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (count != 0.obs) {
        decrementCount();
      } else {
        enableResend.value = true;
      }
      print(count);
      print(enableResend);
    });
    super.onInit();
  }

  @override
  void onClose() {
    enableResend.close();
    count.close();
    timer?.cancel();
    super.onClose();
  }

  void resetCount() => count.value = 60;
  void decrementCount() => count.value--;
  void reset() {
    resetCount();
    enableResend.value = false;
  }
}
