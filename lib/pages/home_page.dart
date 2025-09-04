import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import 'package:sayan_portfolio/core/constants.dart';
import 'package:sayan_portfolio/sections/about_section.dart';
import 'package:sayan_portfolio/sections/contact_section.dart';
import 'package:sayan_portfolio/sections/exp.dart' show ExpStatus;
import 'package:sayan_portfolio/sections/hero_section.dart';
import 'package:sayan_portfolio/sections/projects_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Create GlobalKeys for each section
  static final GlobalKey heroKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();

  // ScrollController for smooth scrolling
  static final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        animateColor: true,
        shadowColor: Colors.black54,
        titleSpacing: 10,
        title: Obx(
          () => GestureDetector(
            onTap: () => _scrollToSection(heroKey),
            child: Text(
              "#SRG",
              style: GoogleFonts.pixelifySans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: false,
        actions: isDesktop
            ? _buildDesktopActions(themeController)
            : _buildMobileActions(themeController),
      ),
      drawer: isDesktop ? null : _buildDrawer(themeController),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(key: heroKey, child: HeroSection()),
            Container(key: aboutKey, child: AboutSection()),
            ExpStatus(),
            Container(key: projectsKey, child: ProjectsSection()),
            Container(key: contactKey, child: ContactSection()),
            // Add more sections here as needed
          ],
        ),
      ),
    );
  }

  // Method to scroll to a specific section
  static void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  List<Widget> _buildDesktopActions(ThemeController themeController) {
    return [
      _buildNavItem("About", () => _scrollToSection(aboutKey)),
      _buildNavItem("Projects", () => _scrollToSection(projectsKey)),
      _buildNavItem("Contact Me", () => _scrollToSection(contactKey)),
      const SizedBox(width: 16),
      _buildThemeToggle(themeController),
      const SizedBox(width: 16),
    ];
  }

  List<Widget> _buildMobileActions(ThemeController themeController) {
    return [_buildThemeToggle(themeController), const SizedBox(width: 8)];
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: GoogleFonts.pixelifySans(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: themeController.isDarkMode.value
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildThemeToggle(ThemeController themeController) {
    return Obx(
      () => IconButton(
        onPressed: () => themeController.toggleTheme(),
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            themeController.isDarkMode.value
                ? Icons.light_mode
                : Icons.dark_mode,
            key: ValueKey(themeController.isDarkMode.value),
            color: AppColors.primary,
          ),
        ),
        tooltip: themeController.isDarkMode.value
            ? "Switch to Light Mode"
            : "Switch to Dark Mode",
      ),
    );
  }

  Widget _buildDrawer(ThemeController themeController) {
    return Drawer(
      child: Obx(
        () => Container(
          color: themeController.isDarkMode.value
              ? AppColors.backgroundDark
              : AppColors.backgroundLight,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.personDotsFromLine,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Sayan Roy Gupta",
                      style: GoogleFonts.pixelifySans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              _buildDrawerItem("About", Icons.person_outline, () {
                Get.back(); // Close drawer first
                _scrollToSection(aboutKey);
              }),
              _buildDrawerItem("Projects", Icons.work_outline, () {
                Get.back(); // Close drawer first
                _scrollToSection(projectsKey);
              }),
              _buildDrawerItem("Contact Me", Icons.mail_outline, () {
                Get.back(); // Close drawer first
                _scrollToSection(contactKey);
              }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      themeController.isDarkMode.value
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: themeController.isDarkMode.value
                          ? AppColors.darkModeTextColor
                          : AppColors.lightModeTextColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Theme",
                      style: GoogleFonts.montserrat(
                        color: themeController.isDarkMode.value
                            ? AppColors.darkModeTextColor
                            : AppColors.lightModeTextColor,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: themeController.isDarkMode.value,
                      onChanged: (value) => themeController.toggleTheme(),
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => ListTile(
        leading: Icon(
          icon,
          color: themeController.isDarkMode.value
              ? AppColors.darkModeTextColor
              : AppColors.lightModeTextColor,
        ),
        title: Text(
          title,
          style: GoogleFonts.pixelifySans(
            color: themeController.isDarkMode.value
                ? AppColors.darkModeTextColor
                : AppColors.lightModeTextColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
