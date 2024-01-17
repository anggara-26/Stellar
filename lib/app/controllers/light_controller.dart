import 'package:get/get.dart';

class LightController extends GetxController {
  String categorizeIndex(sqmIndex) {
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

  double getPercentageScale(sqmIndex) {
    final percentage = (100 - ((sqmIndex - 17.0) * 20.0)) / 100.0;
    if (percentage < 0.0) {
      return 0.0;
    } else if (percentage > 1.0) {
      return 1.0;
    } else {
      return percentage;
    }
  }
}
