import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_crud9/auth/auth_gate.dart';
import 'package:user_crud9/widgets/global/my_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Image.asset('assets/images/img_intro.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'Connect with\nFriends Instantly',
                style: GoogleFonts.poppins(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 37, 58, 193),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Stay in touch with your loved ones anytime anywhere',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
              child: MyButton(
                height: height,
                width: width,
                text: "Get Started",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthGate(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
