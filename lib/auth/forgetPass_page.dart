import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_crud9/services/functions/auth_service.dart';
import 'package:user_crud9/widgets/global/my_button.dart';
import 'package:user_crud9/widgets/global/my_textfield.dart';

class ForgetPassPage extends StatelessWidget {
  ForgetPassPage({super.key});

  final TextEditingController _forgetPassController = TextEditingController();

  void forgetPass() async {
    final _auth = AuthService();

    await _auth.forgetPassword(_forgetPassController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 1 / 12,
              ),
              Text(
                'Forgot Your Password?',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 37, 58, 193),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 1 / 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Don’t worry! Just enter your email below and we’ll send you a link to reset your password",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 1 / 16,
              ),
              MyTextField(
                text: ' Email',
                controller: _forgetPassController,
              ),
              SizedBox(
                height: height * 1 / 30,
              ),
              SizedBox(
                height: height * 1 / 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MyButton(
                  height: height,
                  width: width,
                  text: 'Send Reset Link',
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: height * 1 / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
