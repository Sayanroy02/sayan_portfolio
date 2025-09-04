import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PixelSnackbar {
  static void showError({
    required String title,
    required String message,
    bool isMobile = false,
    bool isDarkMode = true,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: isMobile ? SnackPosition.BOTTOM : SnackPosition.TOP,
      backgroundColor: isDarkMode ? Colors.red.shade800 : Colors.red.shade600,
      colorText: Colors.white,
      borderRadius: 8,
      borderWidth: 2,
      borderColor: Colors.red.shade400,
      margin: EdgeInsets.all(isMobile ? 10 : 20),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 20,
        vertical: isMobile ? 12 : 16,
      ),
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      titleText: Text(
        title,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 12 : 14,
          color: Colors.white70,
        ),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.red.shade900,
          offset: Offset(4, 4),
          blurRadius: 0,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(6, 6),
          blurRadius: 0,
          spreadRadius: 0,
        ),
      ],
      icon: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Icon(
          Icons.error_outline,
          color: Colors.white,
          size: isMobile ? 16 : 20,
        ),
      ),
    );
  }

  static void showSuccess({
    required String title,
    required String message,
    bool isMobile = false,
    bool isDarkMode = true,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: isMobile ? SnackPosition.BOTTOM : SnackPosition.TOP,
      backgroundColor: isDarkMode
          ? Colors.green.shade800
          : Colors.green.shade600,
      colorText: Colors.white,
      borderRadius: 8,
      borderWidth: 2,
      borderColor: Colors.green.shade400,
      margin: EdgeInsets.all(isMobile ? 10 : 20),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 20,
        vertical: isMobile ? 12 : 16,
      ),
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      titleText: Text(
        title,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 12 : 14,
          color: Colors.white70,
        ),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.green.shade900,
          offset: Offset(4, 4),
          blurRadius: 0,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(6, 6),
          blurRadius: 0,
          spreadRadius: 0,
        ),
      ],
      icon: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Icon(
          Icons.check_circle_outline,
          color: Colors.white,
          size: isMobile ? 16 : 20,
        ),
      ),
    );
  }

  static void showWarning({
    required String title,
    required String message,
    bool isMobile = false,
    bool isDarkMode = true,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: isMobile ? SnackPosition.BOTTOM : SnackPosition.TOP,
      backgroundColor: isDarkMode
          ? Colors.orange.shade800
          : Colors.orange.shade600,
      colorText: Colors.white,
      borderRadius: 8,
      borderWidth: 2,
      borderColor: Colors.orange.shade400,
      margin: EdgeInsets.all(isMobile ? 10 : 20),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 20,
        vertical: isMobile ? 12 : 16,
      ),
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      titleText: Text(
        title,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 12 : 14,
          color: Colors.white70,
        ),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.orange.shade900,
          offset: Offset(4, 4),
          blurRadius: 0,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(6, 6),
          blurRadius: 0,
          spreadRadius: 0,
        ),
      ],
      icon: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.orange.shade400,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Icon(
          Icons.warning_outlined,
          color: Colors.white,
          size: isMobile ? 16 : 20,
        ),
      ),
    );
  }

  static void showInfo({
    required String title,
    required String message,
    bool isMobile = false,
    bool isDarkMode = true,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: isMobile ? SnackPosition.BOTTOM : SnackPosition.TOP,
      backgroundColor: isDarkMode
          ? Colors.amber.shade800
          : Colors.amber.shade600,
      colorText: Colors.black,
      borderRadius: 8,
      borderWidth: 2,
      borderColor: Colors.amber.shade400,
      margin: EdgeInsets.all(isMobile ? 10 : 20),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 20,
        vertical: isMobile ? 12 : 16,
      ),
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      titleText: Text(
        title,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.pixelifySans(
          fontSize: isMobile ? 12 : 14,
          color: Colors.black87,
        ),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.amber.shade900,
          offset: Offset(4, 4),
          blurRadius: 0,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(6, 6),
          blurRadius: 0,
          spreadRadius: 0,
        ),
      ],
      icon: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.amber.shade400,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Icon(
          Icons.info_outline,
          color: Colors.black,
          size: isMobile ? 16 : 20,
        ),
      ),
    );
  }

  // Custom snackbar with theme controller integration
  static void showCustom({
    required String title,
    required String message,
    required bool isMobile,
    required bool isDarkMode,
    SnackbarType type = SnackbarType.info,
  }) {
    switch (type) {
      case SnackbarType.error:
        showError(
          title: title,
          message: message,
          isMobile: isMobile,
          isDarkMode: isDarkMode,
        );
        break;
      case SnackbarType.success:
        showSuccess(
          title: title,
          message: message,
          isMobile: isMobile,
          isDarkMode: isDarkMode,
        );
        break;
      case SnackbarType.warning:
        showWarning(
          title: title,
          message: message,
          isMobile: isMobile,
          isDarkMode: isDarkMode,
        );
        break;
      case SnackbarType.info:
        showInfo(
          title: title,
          message: message,
          isMobile: isMobile,
          isDarkMode: isDarkMode,
        );
        break;
    }
  }
}

enum SnackbarType { error, success, warning, info }
