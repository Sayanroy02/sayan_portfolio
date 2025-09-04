import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayan_portfolio/controllers/theme_controler.dart';
import 'package:sayan_portfolio/widgets/featured_projects_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
        padding: EdgeInsets.all(20),
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
          color: themeController.isDarkMode.value ? Colors.black : Colors.white,
        ),
        child: isDesktop
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#Featured Projects",
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //PROJECT 1
                      FeaturedProjectsWidget(
                        containerImgHeight: size.height * 0.3,
                        containerColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,
                        borderColor: Colors.deepOrange.shade700,
                        pNameColor: Colors.deepOrange.shade500,
                        containerWidth: isDesktop
                            ? size.width * 0.2
                            : size.width,
                        projectName: "Mega Blog",
                        projectDesc:
                            "A blog Website where uses can write and upload blog anonymously.",
                        projectStack: "React , Redux , Tailwind CSS , Appwrite",
                        projectImg:
                            "https://media.licdn.com/dms/image/v2/D5622AQFlV5WWGTx2Aw/feedshare-shrink_1280/B56ZjL_DGgHMAs-/0/1755768961159?e=1759968000&v=beta&t=9xFn5Nv97iyaMLnX8pZudefqBlp5Gr2d4FR9OV0cO2Q",
                        btnColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,

                        onPressed: () {},
                      ),

                      //PROJECT 2
                      FeaturedProjectsWidget(
                        containerImgHeight: size.height * 0.3,
                        containerColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,
                        borderColor: Colors.blue.shade600,
                        containerWidth: isDesktop
                            ? size.width * 0.2
                            : size.width,
                        pNameColor: Colors.blue.shade600,
                        projectName: "Art Fuse",
                        projectDesc:
                            "A Mobile Walpaper Application where you can choose any walpaper and set on your phone.",
                        projectStack: "Flutter , Dart , Pixels API ",
                        projectImg:
                            "https://media.licdn.com/dms/image/v2/D5622AQHWzJxA_RAyxA/feedshare-shrink_1280/feedshare-shrink_1280/0/1712595726442?e=1759968000&v=beta&t=svnExOGLDXnoOaumpJBiRjawUcFs6yAdcm_GG_XBj90",
                        btnColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,
                        onPressed: () {},
                      ),
                      //PROJECT 3
                      FeaturedProjectsWidget(
                        containerImgHeight: size.height * 0.3,
                        containerColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,
                        borderColor: Colors.blue.shade900,
                        pNameColor: Colors.blue.shade900,
                        containerWidth: isDesktop
                            ? size.width * 0.2
                            : size.width,
                        projectName: "Notify",
                        projectDesc:
                            "A Notes Website where user can keep create , Read , Update and Delete notes.",
                        projectStack: "EJS,CSS,Node JS,Mongo DB",
                        projectImg: "https://i.ibb.co/C3YL88QR/notify.png",
                        btnColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,
                        onPressed: () {},
                      ),
                      //Project 4
                      FeaturedProjectsWidget(
                        containerImgHeight: size.height * 0.3,
                        containerColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,
                        borderColor: Colors.yellow.shade800,
                        containerWidth: isDesktop
                            ? size.width * 0.2
                            : size.width,
                        pNameColor: Colors.yellow.shade800,
                        projectName: "Sikkim Interior",
                        projectDesc:
                            "A Static responsive website for a client for his interior design business and Whatsapp Query.",
                        projectStack: "React,Redux,TailWind CSS ",
                        projectImg: "https://i.ibb.co/gbtyY49p/SK-1.png",
                        btnColor: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white,

                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              )
            //MOBILE VERSION
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "#Featured Projects",
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
                  SizedBox(height: 20),
                  //PROJECT 1
                  FeaturedProjectsWidget(
                    containerImgHeight: size.height * 0.3,
                    containerColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                    borderColor: Colors.deepOrange.shade700,
                    pNameColor: Colors.deepOrange.shade500,
                    containerWidth: isDesktop ? size.width * 0.2 : size.width,
                    projectName: "Mega Blog",
                    projectDesc:
                        "A blog Website where uses can write and upload blog anonymously.",
                    projectStack: "React , Redux , Tailwind CSS , Appwrite",
                    projectImg:
                        "https://media.licdn.com/dms/image/v2/D5622AQFlV5WWGTx2Aw/feedshare-shrink_1280/B56ZjL_DGgHMAs-/0/1755768961159?e=1759968000&v=beta&t=9xFn5Nv97iyaMLnX8pZudefqBlp5Gr2d4FR9OV0cO2Q",
                    btnColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,

                    onPressed: () {},
                  ),

                  SizedBox(height: 20),

                  //PROJECT 2
                  FeaturedProjectsWidget(
                    containerImgHeight: size.height * 0.3,
                    containerColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                    borderColor: Colors.blue.shade600,
                    containerWidth: isDesktop ? size.width * 0.2 : size.width,
                    pNameColor: Colors.blue.shade600,
                    projectName: "Art Fuse",
                    projectDesc:
                        "A Mobile Walpaper Application where you can choose any walpaper and set on your phone.",
                    projectStack: "Flutter , Dart , Pixels API ",
                    projectImg:
                        "https://media.licdn.com/dms/image/v2/D5622AQHWzJxA_RAyxA/feedshare-shrink_1280/feedshare-shrink_1280/0/1712595726442?e=1759968000&v=beta&t=svnExOGLDXnoOaumpJBiRjawUcFs6yAdcm_GG_XBj90",
                    btnColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,

                    onPressed: () {},
                  ),

                  SizedBox(height: 20),
                  //PROJECT 3
                  FeaturedProjectsWidget(
                    containerImgHeight: size.height * 0.3,
                    containerColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                    borderColor: Colors.blue.shade900,
                    pNameColor: Colors.blue.shade900,
                    containerWidth: isDesktop ? size.width * 0.2 : size.width,
                    projectName: "Notify",
                    projectDesc:
                        "A Notes Website where user can keep create , Read , Update and Delete notes.",
                    projectStack: "EJS,CSS,Node JS,Mongo DB",
                    projectImg: "https://i.ibb.co/C3YL88QR/notify.png",
                    btnColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,

                    onPressed: () {},
                  ),

                  SizedBox(height: 20),
                  //Project 4
                  FeaturedProjectsWidget(
                    containerImgHeight: size.height * 0.3,
                    containerColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                    borderColor: Colors.yellow.shade800,
                    containerWidth: isDesktop ? size.width * 0.2 : size.width,
                    pNameColor: Colors.yellow.shade800,
                    projectName: "Sikkim Interior",
                    projectDesc:
                        "A Static responsive website for a client for his interior design business and Whatsapp Query.",
                    projectStack: "React,Redux,TailWind CSS ",
                    projectImg: "https://i.ibb.co/gbtyY49p/SK-1.png",
                    btnColor: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
      ),
    );
  }
}
