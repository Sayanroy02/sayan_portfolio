import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import 'package:sayan_portfolio/core/theme.dart';
import 'package:sayan_portfolio/pages/home_page.dart';

void main() {
  // Initialize dependencies once
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: 'Sayan Roy Gupta Portfolio',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
