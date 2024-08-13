import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_crud9/auth/forgetPass_page.dart';
import 'package:user_crud9/services/functions/auth_service.dart';
import 'package:user_crud9/widgets/global/my_button.dart';
import 'package:user_crud9/widgets/global/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final void Function()? showRegisterPage;
  LoginPage({super.key, required this.showRegisterPage});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context) async {
    //get auth service
    final _auth = AuthService();

    try {
      await _auth.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
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
                  'Login here',
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
                Text(
                  "Welcome back you've\nbeen missed!",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //forget password page navigate
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassPage(),
                              ));
                        },
                        child: Text(
                          'Forget password?',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 37, 58, 193),
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 1 / 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyButton(
                    height: height,
                    width: width,
                    text: 'Sign In',
                    onTap: () => login(context),
                  ),
                ),
                SizedBox(
                  height: height * 1 / 20,
                ),
                GestureDetector(
                  onTap: showRegisterPage,
                  child: Text(
                    'Create new account!',
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
