import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;
    final isMobile = size.width < 800;
    return Obx(
      () => Container(
        width: size.width * 1,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: themeController.isDarkMode.value
                ? Colors.amber.shade300
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // Pixel-style shadow effect
            BoxShadow(
              color: Colors.amber.shade400.withOpacity(0.8),
              offset: Offset(8, 8),
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(12, 12),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              themeController.isDarkMode.value
                  ? Colors.amber.shade600
                  : Colors.amber.shade400,
              themeController.isDarkMode.value ? Colors.black : Colors.white,
            ],
            tileMode: TileMode.clamp,
            transform: GradientRotation(0.9),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.1, 0.2],
          ),
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(30), // Increased padding
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "#About",
                    style: GoogleFonts.pixelifySans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: LottieBuilder.asset(
                      "assets/questioncoin.json",
                      animate: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  BlurText(
                    text:
                        "Hi, I'm Sayan Roy Gupta — an Application Developer (Flutter) and Web Developer. "
                        "I am currently pursuing MCA from IGNOU and hold a Bachelor's degree from Siliguri College. "
                        "With 1 year of experience in building mobile applications and 6 months in web development, "
                        "I specialize in creating modern, scalable solutions like POS systems, CRM platforms, "
                        "and E-commerce applications. "
                        "My design approach blends spacetype layouts, modern UX patterns, and unique pixelated styles "
                        "to deliver functional yet visually engaging digital experiences.",
                    textStyle: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    mode: AnimationMode.forward,
                    type: AnimationType.word,
                    duration: Duration(milliseconds: 500),
                  ),
                  SizedBox(height: 10),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#About",
                    style: GoogleFonts.pixelifySans(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        child: BlurText(
                          text:
                              "Hi, I'm Sayan Roy Gupta — an Application Developer (Flutter) and Web Developer. "
                              "I am currently pursuing MCA from IGNOU and hold a Bachelor's degree from Siliguri College. "
                              "With 1 year of experience in building mobile applications and 6 months in web development, "
                              "I specialize in creating modern, scalable solutions like POS systems, CRM platforms, "
                              "and E-commerce applications. "
                              "My design approach blends spacetype layouts, modern UX patterns, and unique pixelated styles "
                              "to deliver functional yet visually engaging digital experiences.",
                          textStyle: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          mode: AnimationMode.forward,
                          type: AnimationType.word,
                          duration: Duration(milliseconds: 50),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: size.width * 0.35,
                        child: LottieBuilder.asset(
                          "assets/questioncoin.json",
                          animate: true,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
