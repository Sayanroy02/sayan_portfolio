import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
import 'package:sayan_portfolio/widgets/custom_button.dart';

class FeaturedProjectsWidget extends StatelessWidget {
  final Color borderColor;
  final double containerWidth;
  final Color containerColor;
  final String projectImg;
  final String projectName;
  final String projectDesc;
  final String projectStack;
  final double containerImgHeight;
  final Color pNameColor;
  final Color btnColor;
  final VoidCallback onPressed;
  const FeaturedProjectsWidget({
    required this.borderColor,
    required this.containerWidth,
    required this.containerColor,
    required this.projectImg,
    required this.projectName,
    required this.projectDesc,
    required this.projectStack,
    required this.containerImgHeight,
    required this.pNameColor,
    required this.btnColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 4, color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.4),
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
      child: Column(
        children: [
          Container(
            height: containerImgHeight,
            width: size.width,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                projectImg,
                fit: BoxFit.fill,

                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.image),
                        SizedBox(height: 2),
                        Text(
                          "Error loading image",
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlurText(
                  text: projectName,
                  textStyle: GoogleFonts.pixelifySans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: pNameColor,
                  ),
                  duration: Duration(milliseconds: 100),
                  type: AnimationType.word,
                ),
                SizedBox(height: 10),
                BlurText(
                  text: "Desc: $projectDesc",
                  textStyle: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  duration: Duration(milliseconds: 100),
                  type: AnimationType.word,
                ),
                SizedBox(height: 10),
                BlurText(
                  text: "Tech Stack: $projectStack",
                  textStyle: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  duration: Duration(milliseconds: 100),
                  type: AnimationType.word,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  btnColor: btnColor,
                  btnText: 'GitHub',
                  btnicon: FontAwesomeIcons.github,
                  onPressed: onPressed,
                  btnWidth: 100,
                ),
                CustomButtonWidget(
                  btnColor: btnColor,
                  btnText: 'Link',
                  btnicon: FontAwesomeIcons.link,
                  onPressed: onPressed,
                  btnWidth: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
