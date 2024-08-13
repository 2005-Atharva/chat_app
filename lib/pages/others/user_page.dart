import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_crud9/services/functions/auth_service.dart';

class UserPage extends StatelessWidget {
  final String currentUserEmail;

  UserPage({
    super.key,
    required this.currentUserEmail,
  });

  void logOut(BuildContext context) {
    final _auth = AuthService();

    _auth.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 37, 58, 193),
        ),
        title: Text(
          'Profile Page',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 37, 58, 193),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              alignment: Alignment.center,
              height: 80,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(255, 37, 58, 193),
                  )),
              child: Text(
                'Logged in as: $currentUserEmail',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () => logOut(context),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.red.shade200,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  'Log Out',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
