import 'package:eventx/models/user/profile.dart';
import 'package:eventx/models/user/user.dart';
import 'package:eventx/repository/user_repository.dart';
import 'package:eventx/utils/display_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _globalkey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool boxShadow = true;
  bool success = true;

  @override
  Widget build(BuildContext context) {
    final loginButton = SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        key: const ValueKey('btnLogin'),
        onPressed: () {
          setState(() {
            boxShadow = false;
          });
          if (_globalkey.currentState!.validate()) {
            User user = User(
              profile: Profile(fullName: _fullNameController.text),
              email: _emailController.text,
              password: _passwordController.text,
              category: "CUSTOMER",
            );
            _registerUser(user);
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              // side: const BorderSide(color: Colors.red),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: const Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );

    final fullNameField = Container(
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
          controller: _fullNameController,
          obscureText: false,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff000912),
            ),
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 18),
            hintText: "Full name",
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
          validator: (value) => value!.isEmpty
              ? '        * required'
              : (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)
                  ? '        Enter a Valid Name'
                  : null)),
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
                Icon(Icons.email_outlined, size: 30, color: Color(0xffA6B0BD)),
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
          validator: (value) => value!.isEmpty
              ? '        * required'
              : (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)
                  ? null
                  : '        Enter a Valid Email')),
    );

    final passwordField = Container(
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
        controller: _passwordController,
        obscureText: true,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            Icons.lock_outline,
            size: 30,
            color: Color(0xffA6B0BD),
          ),
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

    final confirmPasswordField = Container(
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
          obscureText: true,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff000912),
            ),
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 18),
            hintText: "Confirm Password",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.lock_outline,
              size: 30,
              color: Color(0xffA6B0BD),
            ),
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
            } else if (value != _passwordController.text) {
              return '        Password doesnot match';
            }
            return null;
          }),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _globalkey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Lets get started !",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(221, 19, 19, 19)),
                        ),
                        Text(
                          "Create an account to avail all features",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 141, 148, 156),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  fullNameField,
                  const SizedBox(height: 20),
                  emailField,
                  const SizedBox(height: 20),
                  passwordField,
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlutterPwValidator(
                        controller: _passwordController,
                        minLength: 6,
                        uppercaseCharCount: 1,
                        numericCharCount: 1,
                        specialCharCount: 2,
                        successColor: const Color.fromARGB(255, 60, 211, 83),
                        defaultColor: const Color(0xffA6B0BD),
                        failureColor: const Color.fromARGB(255, 145, 27, 19),
                        width: 400,
                        height: 150,
                        onSuccess: () {
                          setState(() {
                            success = true;
                          });
                        },
                        onFail: () {
                          setState(() {
                            success = false;
                          });
                        }),
                  ),
                  const SizedBox(height: 15),
                  confirmPasswordField,
                  const SizedBox(height: 30),
                  loginButton,
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: GoogleFonts.poppins(fontSize: 16)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Login here",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _displayMessage(bool isSignup) {
    if (isSignup) {
      Navigator.pushNamed(
        context,
        '/OTPVerification',
        arguments: [_emailController.text,"REGISTER"],
      );
      displaySuccessMessage(context, "Register Success");
    } else {
      // debugPrint("kakakakakakak");
      displayErrorMessage(context, "Error registering user");
      // displaySuccessMessage(context, "Register Error");
    }
  }

  _registerUser(User user) async {
    bool isSignup = await UserRepository().registerUser(user);
    debugPrint(isSignup.toString());
    // bool isSignup = true;
    if (isSignup) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }
}
