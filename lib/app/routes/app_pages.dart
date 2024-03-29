import 'package:get/get.dart';

import '../modules/device/bindings/device_binding.dart';
import '../modules/device/device_detail/bindings/device_detail_binding.dart';
import '../modules/device/device_detail/views/device_detail_view.dart';
import '../modules/device/views/device_view.dart';
import '../modules/email_verification/bindings/email_verification_binding.dart';
import '../modules/email_verification/views/email_verification_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/learn/bindings/learn_binding.dart';
import '../modules/learn/views/learn_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/shop/bindings/shop_binding.dart';
import '../modules/shop/views/shop_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DEVICE,
      page: () => DeviceView(),
      binding: DeviceBinding(),
      children: [
        GetPage(
          name: _Paths.DEVICE_DETAIL,
          page: () => DeviceDetailView(),
          binding: DeviceDetailBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => const ShopView(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION,
      page: () => EmailVerificationView(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: _Paths.LEARN,
      page: () => const LearnView(),
      binding: LearnBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
  ];
}
