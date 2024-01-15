import 'package:get/get.dart';

class LightController extends GetxController {
  String categorizeIndex(sqmIndex) {
    if (sqmIndex > 100) {
      return 'Tidak Normal';
    } else if (sqmIndex > 50) {
      return 'Moderate';
    } else {
      return 'Bagus';
    }
  }
}
