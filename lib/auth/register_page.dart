import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_crud9/services/functions/auth_service.dart';
import 'package:user_crud9/widgets/global/my_button.dart';
import 'package:user_crud9/widgets/global/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? showLoginPage;
  RegisterPage({super.key, required this.showLoginPage});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConfirmPasswordController =
      TextEditingController();

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text.trim() ==
        _ConfirmPasswordController.text.trim()) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "Password don't match!",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 1 / 12,
                ),
                Text(
                  'Create Account',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(255, 37, 58, 193),
                  ),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 1 / 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Create an account so you can explore all the existing users",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
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
                  controller: _emailController,
                ),
                SizedBox(
                  height: height * 1 / 30,
                ),
                MyTextField(
                  text: " Password",
                  controller: _passwordController,
                ),
                SizedBox(
                  height: height * 1 / 30,
                ),
                //***** */
                MyTextField(
                  text: ' Confirm Password',
                  controller: _ConfirmPasswordController,
                ),
                SizedBox(
                  height: height * 1 / 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyButton(
                    height: height,
                    width: width,
                    text: 'Sign Up',
                    onTap: () => register(context),
                  ),
                ),
                SizedBox(
                  height: height * 1 / 20,
                ),
                GestureDetector(
                  onTap: showLoginPage,
                  child: Text(
                    'Already have an account?',
                    style: GoogleFonts.poppins(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w500,
                      // color: const Color.fromARGB(255, 37, 58, 193),
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
