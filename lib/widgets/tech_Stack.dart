import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import 'package:sayan_portfolio/core/constants.dart';

class TechStackWidget extends StatelessWidget {
  final String tech;
  final bool isSmall;

  const TechStackWidget({super.key, required this.tech, this.isSmall = false});

  // Tech stack data with icons and colors
  static const Map<String, Map<String, dynamic>> _techStackData = {
    'Flutter': {
      'icon': FontAwesomeIcons.flutter,
      'color': Color(0xFF02569B), // Flutter blue
    },
    'Dart': {
      'icon': FontAwesomeIcons.dartLang,
      'color': Color(0xFF0175C2), // Dart blue
    },
    'HTML': {
      'icon': FontAwesomeIcons.html5,
      'color': Color(0xFFE34F26), // HTML orange
    },
    'CSS': {
      'icon': FontAwesomeIcons.css3Alt,
      'color': Color(0xFF1572B6), // CSS blue
    },
    'Tailwind CSS': {
      'icon': FontAwesomeIcons.css3Alt, // Using CSS icon for Tailwind
      'color': Color(0xFF06B6D4), // Tailwind cyan
    },
    'JavaScript': {
      'icon': FontAwesomeIcons.js,
      'color': Color(0xFFF7DF1E), // JavaScript yellow
    },
    'React JS': {
      'icon': FontAwesomeIcons.react,
      'color': Color(0xFF61DAFB), // React cyan
    },
    'Python': {
      'icon': FontAwesomeIcons.python,
      'color': Color(0xFF3776AB), // Python blue
    },
  };

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final Map<String, dynamic>? techData = _techStackData[tech];
    final IconData icon = techData?['icon'] ?? FontAwesomeIcons.code;
    final Color iconColor = techData?['color'] ?? Colors.grey;

    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(
          horizontal: isSmall ? 10 : 20,
          vertical: isSmall ? 10 : 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isSmall ? 12 : 20,
          vertical: isSmall ? 6 : 10,
        ),
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? AppColors.primaryDarkmode
              : Colors.amber,
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.zero,
          boxShadow: [
            BoxShadow(
              offset: Offset(isSmall ? 2 : 3, isSmall ? 2 : 3),
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: isSmall ? 16 : 20),
            SizedBox(width: isSmall ? 6 : 8),
            Text(
              tech,
              style: GoogleFonts.pixelifySans(
                fontSize: isSmall ? 12 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
