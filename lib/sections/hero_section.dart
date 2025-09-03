import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
import 'package:sayan_portfolio/controllers/heroSection_controller.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import 'package:sayan_portfolio/widgets/custom_button.dart';
import 'package:sayan_portfolio/widgets/tech_Stack.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _scrollController;
  late Animation<double> _scrollAnimation;
  final HeroSectionController linkController = Get.put(HeroSectionController());

  @override
  void initState() {
    super.initState();
    _scrollController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    _scrollAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _scrollController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;
    final isMobile = size.width < 600;

    return Obx(
      () => Container(
        constraints: BoxConstraints(
          minHeight: size.height * 0.6,
          maxHeight: size.height * 0.8,
        ),
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
              themeController.isDarkMode.value ? Colors.black : Colors.white,
              themeController.isDarkMode.value
                  ? Colors.amber
                  : Colors.amber.shade400,
            ],
            tileMode: TileMode.clamp,
            transform: GradientRotation(0.7),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.75, 0.9],
          ),
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(30), // Increased padding
        child: Stack(
          children: [
            // Available to hire badge
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.black),
                  boxShadow: [
                    BoxShadow(offset: Offset(2, 2), color: Colors.black),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Available to hire',
                      style: GoogleFonts.pixelifySans(
                        fontSize: 12,
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
              children: [
                SizedBox(height: 40), // Space for the badge
                // Main row content
                Expanded(
                  flex: 3,
                  child: isDesktop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Name and designation
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sayan Roy Gupta",
                                    style: GoogleFonts.pixelifySans(
                                      fontSize: 48, // Increased font size
                                      fontWeight: FontWeight.bold,
                                      color: themeController.isDarkMode.value
                                          ? Colors.amber
                                          : Colors.amber.shade600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Flutter Developer | Web Developer",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 22, // Increased font size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  BlurText(
                                    text:
                                        "I build fast, scalable and modern apps & websites",
                                    textStyle: GoogleFonts.dmSans(
                                      fontSize: 18, // Increased font size
                                      fontWeight: FontWeight.w500,
                                    ),
                                    mode: AnimationMode.forward,
                                    type: AnimationType.word,
                                    duration: Duration(milliseconds: 500),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    children: [
                                      CustomButtonWidget(
                                        btnColor: Colors.amber,
                                        btnText: 'Github',
                                        btnicon: FontAwesomeIcons.github,
                                        onPressed: () {
                                          linkController.openGithub();
                                        },
                                        btnWidth:
                                            MediaQuery.of(context).size.width *
                                            0.12, // Increased width
                                      ),
                                      SizedBox(width: 15),
                                      CustomButtonWidget(
                                        btnColor:
                                            themeController.isDarkMode.value
                                            ? Colors.black
                                            : Colors.white,
                                        btnText: 'Resume',
                                        btnicon: Icons.document_scanner_rounded,
                                        onPressed: () {
                                          linkController.downloadResume();
                                        },
                                        btnWidth:
                                            MediaQuery.of(context).size.width *
                                            0.12, // Increased width
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 60), // Increased spacing
                            // Elements and image with pixelated design
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Container(
                                  width: 400, // Increased width
                                  height: 320, // Increased height
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 6, // Thicker border
                                      color: themeController.isDarkMode.value
                                          ? Colors.amber
                                          : Colors.amber.shade600,
                                    ),
                                    borderRadius: BorderRadius.zero,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(6, 0),
                                        color: Colors.black,
                                      ),
                                      BoxShadow(
                                        offset: Offset(0, 6),
                                        color: Colors.black,
                                      ),
                                      BoxShadow(
                                        offset: Offset(6, 6),
                                        color: Colors.black,
                                      ),
                                      BoxShadow(
                                        offset: Offset(12, 12),
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
                                                    ? Colors.amber.withOpacity(
                                                        0.1,
                                                      )
                                                    : Colors.amber.withOpacity(
                                                        0.05,
                                                      ),
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
                                          {'top': -3.0, 'left': -3.0},
                                          {'top': -3.0, 'right': -3.0},
                                          {'bottom': -3.0, 'left': -3.0},
                                          {'bottom': -3.0, 'right': -3.0},
                                        ];
                                        final pos = positions[index];
                                        return Positioned(
                                          top: pos['top'],
                                          left: pos['left'],
                                          right: pos['right'],
                                          bottom: pos['bottom'],
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            color: Colors.amber,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Mobile Image Section
                            Container(
                              width: size.width * 0.6,
                              height: size.width * 0.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 4,
                                  color: themeController.isDarkMode.value
                                      ? Colors.amber
                                      : Colors.amber.shade600,
                                ),
                                borderRadius: BorderRadius.zero,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 0),
                                    color: Colors.black,
                                  ),
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    color: Colors.black,
                                  ),
                                  BoxShadow(
                                    offset: Offset(4, 4),
                                    color: Colors.black,
                                  ),
                                  BoxShadow(
                                    offset: Offset(8, 8),
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
                                                : Colors.amber.withOpacity(
                                                    0.05,
                                                  ),
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
                                      {'top': -2.0, 'left': -2.0},
                                      {'top': -2.0, 'right': -2.0},
                                      {'bottom': -2.0, 'left': -2.0},
                                      {'bottom': -2.0, 'right': -2.0},
                                    ];
                                    final pos = positions[index];
                                    return Positioned(
                                      top: pos['top'],
                                      left: pos['left'],
                                      right: pos['right'],
                                      bottom: pos['bottom'],
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        color: Colors.amber,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),

                            SizedBox(height: 30),

                            // Mobile Content Section
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sayan Roy Gupta",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.pixelifySans(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: themeController.isDarkMode.value
                                          ? Colors.amber
                                          : Colors.amber.shade600,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Flutter Developer | Web Developer",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  BlurText(
                                    text:
                                        "I build fast, scalable and modern apps & websites",
                                    textStyle: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    mode: AnimationMode.forward,
                                    type: AnimationType.word,
                                    duration: Duration(milliseconds: 500),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButtonWidget(
                                        btnColor: Colors.amber,
                                        btnText: 'Github',
                                        btnicon: Icons.generating_tokens_sharp,
                                        onPressed: () {
                                          linkController.openGithub();
                                        },
                                        btnWidth: size.width * 0.25,
                                      ),
                                      SizedBox(width: 10),
                                      CustomButtonWidget(
                                        btnColor:
                                            themeController.isDarkMode.value
                                            ? Colors.black
                                            : Colors.white,
                                        btnText: 'Resume',
                                        btnicon: Icons.document_scanner_rounded,
                                        onPressed: () {
                                          linkController.downloadResume();
                                        },
                                        btnWidth: size.width * 0.25,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),

                // Animated Tech Stack Band
                Container(
                  height: 80,
                  margin: EdgeInsets.only(top: 20),
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
                      animation: _scrollAnimation,
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
                                  stops: [0.0, 0.5, 1.0],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                            // Scrolling tech stack
                            Positioned(
                              left: -300 + (_scrollAnimation.value * 600),
                              child: Row(
                                children: [
                                  // First set of tech stack items
                                  ...techStack.map(
                                    (tech) => buildTechStackItem(tech),
                                  ),
                                  // Duplicate for seamless loop
                                  ...techStack.map(
                                    (tech) => buildTechStackItem(tech),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
