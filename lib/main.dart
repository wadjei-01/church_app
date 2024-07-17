import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/navbar/navbar_binding.dart';
import 'package:gtp_app/routes/approutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 2400),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AdaptiveTheme(
              light: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.red,
                  useMaterial3: true),
              dark: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.red,
                  useMaterial3: true,
                  scaffoldBackgroundColor: Colors.black),
              initial: AdaptiveThemeMode.dark,
              builder: (theme, darktheme) => GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    darkTheme: ThemeData.dark(useMaterial3: true),
                    theme: darktheme,
                    initialRoute: '/nav',
                    initialBinding: NavBarBinding(),
                    getPages: appRoutes(),
                  ));
        });
  }
}
