import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
import 'package:sayan_portfolio/controllers/heroSection_controller.dart';
import 'package:sayan_portfolio/controllers/techStack_controller.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import 'package:sayan_portfolio/core/constants.dart';
import 'package:sayan_portfolio/widgets/custom_button.dart';
import 'package:sayan_portfolio/widgets/tech_Stack.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final linkController = Get.put(HeroSectionController());
    final animationController = Get.put(HeroSectionAnimationController());
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;
    final isMobile = size.width < 600;
    final isSmallMobile = size.width < 400;

    return Obx(
      () => Container(
        width: double.infinity,
        // Remove fixed height constraints to allow content-based sizing
        constraints: BoxConstraints(
          minHeight: isSmallMobile ? 400 : size.height * 0.6,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: themeController.isDarkMode.value
                ? AppColors.primaryDarkmode
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // Reduced shadow for small screens
            BoxShadow(
              color: Colors.amber.shade400.withOpacity(0.8),
              offset: Offset(isSmallMobile ? 4 : 8, isSmallMobile ? 4 : 8),
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(isSmallMobile ? 6 : 12, isSmallMobile ? 6 : 12),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              themeController.isDarkMode.value ? Colors.black : Colors.white,
              themeController.isDarkMode.value
                  ? AppColors.primaryDarkmode
                  : Colors.amber.shade400,
            ],
            tileMode: TileMode.clamp,
            transform: const GradientRotation(0.7),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.75, 0.9],
          ),
        ),
        margin: EdgeInsets.all(isSmallMobile ? 10 : 20),
        padding: EdgeInsets.all(isSmallMobile ? 15 : 30),
        child: Stack(
          children: [
            // Available to hire badge - made responsive
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallMobile ? 8 : 12,
                  vertical: isSmallMobile ? 4 : 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.black),
                  boxShadow: const [
                    BoxShadow(offset: Offset(2, 2), color: Colors.black),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: isSmallMobile ? 6 : 8,
                      height: isSmallMobile ? 6 : 8,
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: isSmallMobile ? 4 : 6),
                    Text(
                      'Available to hire',
                      style: GoogleFonts.pixelifySans(
                        fontSize: isSmallMobile ? 10 : 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Main content
            Column(
              mainAxisSize: MainAxisSize.min, // Allow column to shrink
              children: [
                SizedBox(
                  height: isSmallMobile ? 30 : 40,
                ), // Space for the badge
                // Main content
                isDesktop
                    ? _buildDesktopLayout(
                        themeController,
                        linkController,
                        context,
                      )
                    : _buildMobileLayout(
                        themeController,
                        linkController,
                        context,
                        size,
                        isSmallMobile,
                      ),

                // Animated Tech Stack Band
                SizedBox(height: isSmallMobile ? 15 : 20),
                _buildAnimatedTechStack(
                  themeController,
                  animationController,
                  isSmallMobile,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    ThemeController themeController,
    HeroSectionController linkController,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Name and designation
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sayan Roy Gupta",
                style: GoogleFonts.pixelifySans(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: themeController.isDarkMode.value
                      ? AppColors.primaryDarkmode
                      : Colors.amber.shade600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Flutter Developer | Web Developer",
                style: GoogleFonts.dmSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              BlurText(
                text: "I build fast, scalable and modern apps & websites",
                textStyle: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                mode: AnimationMode.forward,
                type: AnimationType.word,
                duration: const Duration(milliseconds: 500),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  CustomButtonWidget(
                    btnColor: themeController.isDarkMode.value
                        ? AppColors.primaryDarkmode
                        : Colors.amber,
                    btnText: 'Github',
                    btnicon: FontAwesomeIcons.github,
                    onPressed: () {
                      linkController.openGithub();
                    },
                    btnWidth: MediaQuery.of(context).size.width * 0.12,
                  ),
                  const SizedBox(width: 15),
                  CustomButtonWidget(
                    btnColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                    btnText: 'Resume',
                    btnicon: Icons.document_scanner_rounded,
                    onPressed: () {
                      linkController.downloadResume();
                    },
                    btnWidth: MediaQuery.of(context).size.width * 0.12,
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 60),
        // Elements and image with pixelated design
        Expanded(
          flex: 1,
          child: Center(
            child: _buildProfileImage(themeController, 400, 320, 6, 12),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    ThemeController themeController,
    HeroSectionController linkController,
    BuildContext context,
    Size size,
    bool isSmallMobile,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Allow column to shrink
      children: [
        // Mobile Image Section - made responsive
        _buildProfileImage(
          themeController,
          isSmallMobile ? size.width * 0.7 : size.width * 0.6,
          isSmallMobile ? size.width * 0.6 : size.width * 0.5,
          isSmallMobile ? 3 : 4,
          isSmallMobile ? 6 : 8,
        ),

        SizedBox(height: isSmallMobile ? 20 : 30),

        // Mobile Content Section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallMobile ? 10 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Sayan Roy Gupta",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pixelifySans(
                    fontSize: isSmallMobile ? 24 : 28,
                    fontWeight: FontWeight.bold,
                    color: themeController.isDarkMode.value
                        ? AppColors.primaryDarkmode
                        : Colors.amber,
                  ),
                ),
              ),
              SizedBox(height: isSmallMobile ? 6 : 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Flutter Developer | Web Developer",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: isSmallMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: isSmallMobile ? 10 : 12),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallMobile ? 5 : 0,
                ),
                child: BlurText(
                  text: "I build fast, scalable and modern apps & websites",
                  textStyle: GoogleFonts.dmSans(
                    fontSize: isSmallMobile ? 12 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                  mode: AnimationMode.forward,
                  type: AnimationType.word,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
              SizedBox(height: isSmallMobile ? 15 : 20),
              // Responsive button layout
              isSmallMobile
                  ? Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: CustomButtonWidget(
                            btnColor: themeController.isDarkMode.value
                                ? AppColors.primaryDarkmode
                                : Colors.amber,
                            btnText: 'Github',
                            btnicon: Icons.generating_tokens_sharp,
                            onPressed: () {
                              linkController.openGithub();
                            },
                            btnWidth: size.width * 0.6,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: size.width * 0.6,
                          child: CustomButtonWidget(
                            btnColor: themeController.isDarkMode.value
                                ? Colors.black
                                : Colors.white,
                            btnText: 'Resume',
                            btnicon: Icons.document_scanner_rounded,
                            onPressed: () {
                              linkController.downloadResume();
                            },
                            btnWidth: size.width * 0.6,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomButtonWidget(
                            btnColor: themeController.isDarkMode.value
                                ? AppColors.primaryDarkmode
                                : Colors.amber,
                            btnText: 'Github',
                            btnicon: Icons.generating_tokens_sharp,
                            onPressed: () {
                              linkController.openGithub();
                            },
                            btnWidth: size.width * 0.25,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: CustomButtonWidget(
                            btnColor: themeController.isDarkMode.value
                                ? Colors.black
                                : Colors.white,
                            btnText: 'Resume',
                            btnicon: Icons.document_scanner_rounded,
                            onPressed: () {
                              linkController.downloadResume();
                            },
                            btnWidth: size.width * 0.25,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(
    ThemeController themeController,
    double width,
    double height,
    double borderWidth,
    double shadowOffset,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth,
          color: themeController.isDarkMode.value
              ? AppColors.primaryDarkmode
              : Colors.amber,
        ),
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(offset: Offset(shadowOffset / 2, 0), color: Colors.black),
          BoxShadow(offset: Offset(0, shadowOffset / 2), color: Colors.black),
          BoxShadow(
            offset: Offset(shadowOffset / 2, shadowOffset / 2),
            color: Colors.black,
          ),
          BoxShadow(
            offset: Offset(shadowOffset, shadowOffset),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    themeController.isDarkMode.value
                        ? Colors.amber.withOpacity(0.1)
                        : Colors.amber.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Corner decorations
          ...List.generate(4, (index) {
            final positions = [
              {'top': -borderWidth / 2, 'left': -borderWidth / 2},
              {'top': -borderWidth / 2, 'right': -borderWidth / 2},
              {'bottom': -borderWidth / 2, 'left': -borderWidth / 2},
              {'bottom': -borderWidth / 2, 'right': -borderWidth / 2},
            ];
            final pos = positions[index];
            return Positioned(
              top: pos['top'],
              left: pos['left'],
              right: pos['right'],
              bottom: pos['bottom'],
              child: Container(
                width: borderWidth * 2,
                height: borderWidth * 2,
                color: themeController.isDarkMode.value
                    ? AppColors.primaryDarkmode
                    : Colors.amber,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAnimatedTechStack(
    ThemeController themeController,
    HeroSectionAnimationController animationController,
    bool isSmallMobile,
  ) {
    return Container(
      width: double.infinity,
      height: isSmallMobile ? 60 : 80,
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? Colors.black.withOpacity(0.3)
            : Colors.white.withOpacity(0.3),
        border: Border.all(width: 2, color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: AnimatedBuilder(
          animation: animationController.scrollAnimation,
          builder: (context, child) {
            return Stack(
              children: [
                // Background pattern
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.amber.withOpacity(0.1),
                        Colors.amber.withOpacity(0.05),
                        Colors.amber.withOpacity(0.1),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                // Scrolling tech stack (right to left) - fixed overflow
                Positioned(
                  left:
                      -200 + (animationController.scrollAnimation.value * 400),
                  child: Row(
                    children: [
                      // First set of tech stack items
                      ...animationController.techStack.map(
                        (tech) =>
                            TechStackWidget(tech: tech, isSmall: isSmallMobile),
                      ),
                      // Duplicate for seamless loop
                      ...animationController.techStack.map(
                        (tech) =>
                            TechStackWidget(tech: tech, isSmall: isSmallMobile),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
