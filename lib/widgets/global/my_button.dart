import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 1 / 12.5,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 58, 193),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 37, 58, 193),
              blurRadius: 10,
              offset: Offset(2, 6),
              spreadRadius: 0.1,
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
