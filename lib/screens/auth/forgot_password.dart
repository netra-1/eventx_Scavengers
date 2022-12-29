import 'package:eventxandroid/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);


  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _globalkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool boxShadow = true;

  @override
  Widget build(BuildContext context) {
    final resetPassword = SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        key: const ValueKey('btnReset'),
        onPressed: () {
          setState(() {
            boxShadow = false;
          });
          if (_globalkey.currentState!.validate()) {
            _resetPassword();
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              // side: const BorderSide(color: Colors.red),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: const Text(
          "Reset Password",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );

    final emailField = Container(
      decoration: boxShadow == true
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 25,
                  offset: Offset(0, 4),
                  spreadRadius: -25,
                ),
              ],
            )
          : const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
      child: TextFormField(
        key: const ValueKey('txtEmail'),
        controller: _emailController,
        obscureText: false,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          hintText: "Email address",
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon:
              Icon(Icons.person_outline, size: 30, color: Color(0xffA6B0BD)),
          prefixIconConstraints: BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          // errorStyle: TextStyle(wordSpacing: 10),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '        * required';
          }
          return null;
        },
      ),
    );

    return Scaffold(
      // backgroundColor: Colors.lightGreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _globalkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 50,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color.fromRGBO(97, 62, 234, 1),

                              // border:
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(118, 125, 152, 1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Center(
                    child: CircleAvatar(
                      radius: 59,
                      backgroundImage: NetworkImage(
                        "https://cdn.vectorstock.com/i/1000x1000/98/01/windmill-event-management-logo-vector-29969801.webp",
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  emailField,
                  const SizedBox(height: 40),
                  resetPassword,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToScreen(bool isLogin) async {
    if (isLogin) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        '/OTPVerification',
        arguments: [_emailController.text,"FORGOT_PASSWORD"],
      );
      // ignore: use_build_context_synchronously
      MotionToast.success(
              description:
                  const Text("        Verification OTP sent            ."))
          .show(context);
    } else {
      MotionToast.error(description: const Text("Invalid user credentials"))
          .show(context);
    }
  }

  _resetPassword() async {
    try {
      UserRepository userRepository = UserRepository();
      List<dynamic> isLogin = await userRepository.forgotPassword(
        _emailController.text,
      );
      // bool isLogin = true;
      if (isLogin[0]) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(description: Text("Error: ${e.toString()}"))
          .show(context);
    }
  }
}
