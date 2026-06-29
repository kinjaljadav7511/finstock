import 'package:finstock/src/routes/app_routes.dart';
import 'package:finstock/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(375, 812), // your design frame size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.scaffoldPage,
          getPages: AppRoutes.routes,
          title: 'FinStock',
          //theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        );
      },
    );
  }
}
