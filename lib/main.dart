import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindo/config/theme.dart';
import 'package:mindo/providers/text_field_error_provider.dart';
import 'package:mindo/screens/authentication_screens/login_screen.dart';
import 'package:mindo/screens/authentication_screens/signup_screen.dart';
import 'package:mindo/screens/intro_screens/intro_screen.dart';
import 'package:mindo/screens/level_selection_screen.dart';
import 'package:mindo/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TextFieldErrorProvider()),
          ],
          child: MaterialApp(

            theme:themeData,
            debugShowCheckedModeBanner: false,
            title: "Mindo",
            home: const WelcomeScreen(),
          ),
        );
      }
    );
  }
}
