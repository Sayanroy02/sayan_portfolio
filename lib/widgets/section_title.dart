import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color borderColor;
  final Color sectionColor;
  const SectionTitle({
    super.key,
    required this.title,
    required this.borderColor,
    required this.sectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: sectionColor,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "#$title",
        style: GoogleFonts.pixelifySans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
