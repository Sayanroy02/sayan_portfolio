import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayan_portfolio/core/theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(
      isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme,
    );
  }

  ThemeData get currentTheme =>
      isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme;
}
