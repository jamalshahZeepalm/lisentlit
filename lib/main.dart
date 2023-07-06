import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/pages/landingScreen/landing_screen.dart';
import 'package:listenlit/pages/onboarding/onboarding_view.dart';
import 'package:listenlit/pages/splash/splash_view.dart';
import 'package:listenlit/utils/themes.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
          designSize: Size(390, 844),
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Listen Lit',

              // You can use the library anywhere in the app even in theme
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              home: child,
            );
          },
          child: SplashScreen()),
    );
  }
}
