import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';

Widget buildTechStackItem(String tech) {
  final themeController = Get.find<ThemeController>();
  // Created a map for tech stack icons and colors
  final Map<String, Map<String, dynamic>> techStackData = {
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
      'color': Color.fromARGB(255, 0, 0, 0), // JavaScript yellow
    },
    'React JS': {
      'icon': FontAwesomeIcons.react,
      'color': Color.fromARGB(255, 36, 162, 197), // React cyan
    },
    'Python': {
      'icon': FontAwesomeIcons.python,
      'color': Color(0xFF3776AB), // Python blue
    },
  };

  final List<String> techStack = [
    'Flutter',
    'Dart',
    'HTML',
    'CSS',
    'Tailwind CSS',
    'JavaScript',
    'React JS',
    'Python',
  ];
  final Map<String, dynamic>? techData = techStackData[tech];
  final IconData icon = techData?['icon'] ?? FontAwesomeIcons.code;
  final Color iconColor = techData?['color'] ?? Colors.grey;

  return Obx(
    () => Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(width: 2, color: Colors.black),
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            color: themeController.isDarkMode.value
                ? Colors.white
                : Colors.black,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          SizedBox(width: 8),
          Text(
            tech,
            style: GoogleFonts.pixelifySans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
