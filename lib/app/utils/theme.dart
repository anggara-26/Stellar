import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/utils/colors.dart';

class TAppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: TColors.primaryColor),
    primaryColor: TColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    textTheme: textTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    textButtonTheme: textButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
  );

  /* App Bar Theme */
  // AppBar Theme
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    scrolledUnderElevation: 0.0,
  );

  // Back Button Icon Theme
  static final backButtonIconTheme = IconButton(
    padding: const EdgeInsets.all(8.0),
    onPressed: () => Get.back(),
    icon: Icon(Icons.chevron_left, color: Get.theme.primaryColor, size: 32),
  );

  /* Text Theme */
  static const TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      fontFamily: "poppins",
      color: TColors.primaryColor,
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontFamily: "poppins",
      color: TColors.primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontFamily: "poppins",
      color: TColors.textBodyColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontFamily: "poppins",
      color: TColors.textBodyColor,
      fontSize: 16.0,
    ),
    bodySmall: TextStyle(
      fontFamily: "poppins",
      color: TColors.textBodyColor,
      fontSize: 14.0,
    ),
    labelMedium: TextStyle(
      fontFamily: "poppins",
      color: TColors.textLabelColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: "poppins",
      color: TColors.textLabelColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontFamily: "poppins",
      color: TColors.primaryColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      fontFamily: "poppins",
      color: TColors.primaryColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
  );

  // TextField Decoration Theme
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    prefixIconColor: TColors.primaryColor,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
      borderSide: BorderSide(
        color: TColors.primaryColor,
        width: 1.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
      borderSide: BorderSide(
        color: TColors.primaryColor,
        width: 1.0,
      ),
    ),
    suffixIconColor: const Color(0xFFA1A8B0),
    isDense: true,
    fillColor: const Color(0xFFF9FAFB),
    filled: true,
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        borderSide: BorderSide(color: Color(0xFF1B4965), width: 1.0)),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
    labelStyle: textTheme.labelSmall,
  );

  /* Button Theme */
  // Elevated Button Theme
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontFamily: "poppins",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.all(12.0),
      backgroundColor: TColors.primaryColor,
    ),
  );

  // Text Button Theme
  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
    ),
  );
}
