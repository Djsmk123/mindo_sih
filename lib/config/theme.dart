import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPrimaryColor=Color(0XFF8B78FF);
const kSecondaryColor=Color(0XFF5451D6);
const Color kAppGrey = Color(0xffD9D9D9);
const Color kAppLightGrey = Color(0xffededed);
const Color kdarkgrey = Color(0xff5F5F5F);
const Color kdarkBlue = Color(0xff122a54);
const Color klightBlue = Color(0xff2f669a);
const Color klighterBlue = Color(0xffe9f1fd);

const Color kButtonColor = kdarkBlue;
double kBorderradius10 = 10.r;
double kBorderradius20 = 20.r;
const kPrimaryGradient=LinearGradient(colors:[  kPrimaryColor, kSecondaryColor  ]);
const int _blackPrimaryValue = 0xFF000000;
const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

ThemeData themeData = ThemeData(
    primarySwatch: primaryBlack,
    useMaterial3: true,
    textTheme: const TextTheme().copyWith(
      headlineMedium: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      headlineSmall: const TextStyle(color: Colors.black),
      headlineLarge: TextStyle(
          fontSize:30.sp,
          fontWeight: FontWeight.bold,
          color:  const Color(0XFF2F394B)
      ),
    )).copyWith(
  primaryColor: kPrimaryColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: kdarkBlue,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, color: kdarkBlue),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Colors.transparent, iconTheme: IconThemeData(color: Colors.black, size: 22.h), elevation: 0, toolbarHeight: 60.h),
);