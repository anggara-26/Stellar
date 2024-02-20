import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/utils/loading.dart';
import 'package:stellar/app/utils/theme.dart';
import 'package:stellar/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Stellar',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            theme: TAppTheme.lightTheme,
            title: "Stellar",
            initialRoute:
                snapshot.data != null && snapshot.data?.emailVerified == true
                    ? Routes.LANDING
                    : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }
        return const LoadingView();
      },
    );
  }
}
