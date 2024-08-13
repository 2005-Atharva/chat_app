import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            //icon
            const Icon(
              Icons.person,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            //user name
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
