import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import '../data/about.dart';

class ExpStatus extends StatelessWidget {
  const ExpStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final size = MediaQuery.of(context).size;

    // Enhanced responsive breakpoints
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 768 && size.width < 1024;
    final isMobile = size.width < 768;

    return Obx(
      () => Container(
        width: size.width,
        margin: EdgeInsets.all(isMobile ? 12 : 20),
        child: _buildPixelFrame(
          themeController,
          size,
          isDesktop,
          isTablet,
          isMobile,
        ),
      ),
    );
  }

  Widget _buildPixelFrame(
    ThemeController themeController,
    Size size,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    return Container(
      decoration: BoxDecoration(
        // Pixel-style outer frame
        border: Border.all(
          width: 2,
          color: themeController.isDarkMode.value
              ? Colors.amber.shade300
              : Colors.black,
        ),
        borderRadius: BorderRadius.circular(20), // Sharp pixel corners
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
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // Inner gradient background
          gradient: LinearGradient(
            colors: [
              themeController.isDarkMode.value
                  ? Color(0xFF000000)
                  : Color(0xFFF5F5DC),
              themeController.isDarkMode.value
                  ? Color(0xFF000000)
                  : Color(0xFFFFFFFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
          ),
          // Inner border for double frame effect
          border: Border.all(
            width: 2,
            color: themeController.isDarkMode.value
                ? Colors.amber.shade600.withOpacity(0.5)
                : Colors.amber.shade800.withOpacity(0.3),
          ),
        ),
        padding: EdgeInsets.all(
          isMobile
              ? 16
              : isTablet
              ? 24
              : 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPixelHeader(themeController, isDesktop, isTablet, isMobile),
            SizedBox(height: isMobile ? 20 : 24),
            _buildStatusBoard(
              themeController,
              size,
              isDesktop,
              isTablet,
              isMobile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPixelHeader(
    ThemeController themeController,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    return Row(
      children: [
        // Pixel status indicator
        // Container(
        //   width: isMobile ? 12 : 16,
        //   height: isMobile ? 12 : 16,
        //   decoration: BoxDecoration(
        //     color: Colors.green.shade400,
        //     border: Border.all(color: Colors.black, width: 2),
        //     borderRadius: BorderRadius.zero,
        //   ),
        // ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            "#EXPERIENCE_STATUS_BOARD.EXE",
            style: GoogleFonts.pixelifySans(
              fontSize: isDesktop
                  ? 40
                  : isTablet
                  ? 24
                  : 18,
              fontWeight: FontWeight.bold,
              color: themeController.isDarkMode.value
                  ? Colors.amber.shade300
                  : Colors.black87,
              letterSpacing: 1.2,
            ),
          ),
        ),
        // Blinking cursor
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              '█',
              textStyle: TextStyle(
                fontSize: isDesktop
                    ? 20
                    : isTablet
                    ? 18
                    : 14,
                color: Colors.green.shade400,
              ),
              speed: Duration(milliseconds: 500),
            ),
          ],
          repeatForever: true,
        ),
      ],
    );
  }

  Widget _buildStatusBoard(
    ThemeController themeController,
    Size size,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    if (isMobile) {
      return _buildMobileLayout(themeController);
    } else if (isTablet) {
      return _buildTabletLayout(themeController);
    } else {
      return _buildDesktopLayout(themeController);
    }
  }

  Widget _buildDesktopLayout(ThemeController themeController) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildPixelStatusCard(
                techExp[0],
                themeController,
                FontAwesomeIcons.mobileAlt,
                Colors.blue.shade400,
                true,
                0,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: _buildPixelStatusCard(
                techExp[1],
                themeController,
                FontAwesomeIcons.globe,
                Colors.red.shade400,
                true,
                300,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildPixelStatusCard(
                techExp[2],
                themeController,
                FontAwesomeIcons.projectDiagram,
                Colors.orange.shade400,
                true,
                600,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: _buildPixelStatusCard(
                techExp[3],
                themeController,
                FontAwesomeIcons.handshake,
                Colors.green.shade500,
                true,
                900,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletLayout(ThemeController themeController) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildPixelStatusCard(
                techExp[0],
                themeController,
                FontAwesomeIcons.mobileAlt,
                Colors.blue.shade400,
                false,
                0,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildPixelStatusCard(
                techExp[1],
                themeController,
                FontAwesomeIcons.globe,
                Colors.purple.shade400,
                false,
                200,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildPixelStatusCard(
                techExp[2],
                themeController,
                FontAwesomeIcons.projectDiagram,
                Colors.orange.shade400,
                false,
                400,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildPixelStatusCard(
                techExp[3],
                themeController,
                FontAwesomeIcons.handshake,
                Colors.green.shade400,
                false,
                600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout(ThemeController themeController) {
    return Column(
      children: [
        _buildPixelStatusCard(
          techExp[0],
          themeController,
          FontAwesomeIcons.flutter,
          Colors.blue.shade400,
          false,
          0,
        ),
        SizedBox(height: 16),
        _buildPixelStatusCard(
          techExp[1],
          themeController,
          FontAwesomeIcons.globe,
          Colors.purple.shade400,
          false,
          200,
        ),
        SizedBox(height: 16),
        _buildPixelStatusCard(
          techExp[2],
          themeController,
          FontAwesomeIcons.projectDiagram,
          Colors.orange.shade400,
          false,
          400,
        ),
        SizedBox(height: 16),
        _buildPixelStatusCard(
          techExp[3],
          themeController,
          FontAwesomeIcons.handshake,
          Colors.green.shade400,
          false,
          600,
        ),
      ],
    );
  }

  Widget _buildPixelStatusCard(
    TechItem item,
    ThemeController themeController,
    IconData bgIcon,
    Color accentColor,
    bool isDesktop,
    int animationDelay,
  ) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: _buildCardContent(
              item,
              themeController,
              bgIcon,
              accentColor,
              isDesktop,
              animationDelay,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardContent(
    TechItem item,
    ThemeController themeController,
    IconData bgIcon,
    Color accentColor,
    bool isDesktop,
    int animationDelay,
  ) {
    return Container(
      height: isDesktop ? 100 : 90,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: accentColor),
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.4),
            offset: Offset(4, 4),
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(6, 6),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? Color(0xFF1a1a1a).withOpacity(0.9)
              : Colors.white.withOpacity(0.95),
          border: Border.all(width: 1, color: accentColor.withOpacity(0.5)),
        ),
        child: Stack(
          children: [
            // Animated background pattern
            Positioned.fill(
              child: CustomPaint(
                painter: PixelGridPainter(
                  color: accentColor.withOpacity(0.1),
                  isDark: themeController.isDarkMode.value,
                ),
              ),
            ),

            // Background icon
            Positioned(
              right: 12,
              top: 8,
              child: FaIcon(
                bgIcon,
                size: isDesktop ? 50 : 45,
                color: accentColor.withOpacity(0.15),
              ),
            ),

            // Main content
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  // Animated experience badge
                  Container(
                    width: isDesktop ? 90 : 75,
                    height: isDesktop ? 90 : 75,
                    decoration: BoxDecoration(
                      color: accentColor,
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.zero,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2, 2),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: ScaleText(
                        text: item.exp,
                        duration: const Duration(milliseconds: 200),
                        type: AnimationType.word,
                        textStyle: GoogleFonts.dmSans(
                          fontSize: isDesktop ? 20 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Description with terminal style
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.2),
                            border: Border.all(
                              color: accentColor.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "> STATUS: ACTIVE",
                            style: GoogleFonts.courierPrime(
                              fontSize: isDesktop ? 14 : 9,
                              fontWeight: FontWeight.bold,
                              color: accentColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item.desc.toUpperCase(),
                          style: GoogleFonts.courierPrime(
                            fontSize: isDesktop ? 20 : 12,
                            fontWeight: FontWeight.w600,
                            color: themeController.isDarkMode.value
                                ? Colors.white.withOpacity(0.9)
                                : Colors.black87,
                            letterSpacing: 0.5,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Status indicator
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for pixel grid background
class PixelGridPainter extends CustomPainter {
  final Color color;
  final bool isDark;

  PixelGridPainter({required this.color, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    const gridSize = 8.0;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
