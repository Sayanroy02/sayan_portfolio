import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final IconData btnicon;
  final double btnWidth;
  final VoidCallback onPressed;
  const CustomButtonWidget({
    super.key,
    required this.btnColor,
    required this.btnText,
    required this.btnicon,
    required this.onPressed,
    required this.btnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        padding: EdgeInsets.all(5),
        width: btnWidth,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: btnColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.amber.shade100,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(btnicon),
            SizedBox(width: 2),
            Text(
              btnText,
              style: GoogleFonts.pixelifySans(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
