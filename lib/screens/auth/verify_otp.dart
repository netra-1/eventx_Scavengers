import 'package:eventx/repository/user_repository.dart';
import 'package:eventx/utils/display_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);


  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _globalkey = GlobalKey<FormState>();

  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  final _thirdController = TextEditingController();
  final _fourthController = TextEditingController();
  final _fifthController = TextEditingController();
  final _sixthController = TextEditingController();

  bool validation = false;
  List<dynamic> sendOTPList = [];

  @override
  Widget build(BuildContext context) {
    sendOTPList = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _globalkey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        width: 100,
                      ),
                      const Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(118, 125, 152, 1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Verification Code",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 33),
                  ),
                  const Text(
                    "We have sent a code verification to your email",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  const Text(
                    "Please enter it below",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  // OtpTextField(
                  //   numberOfFields: 5,
                  //   borderColor: const Color(0xFF512DA8),
                  //   //set to true to show as box or false to show as dash
                  //   showFieldAsBox: true,
                  //   //runs when a code is typed in
                  //   onCodeChanged: (String code) {
                  //     //handle validation or checks here
                  //   },
                  //   //runs when every textfield is filled
                  //   onSubmit: (String verificationCode) {
                  //     showDialog(
                  //         context: context,
                  //         builder: (context) {
                  //           return AlertDialog(
                  //             title: const Text("Verification Code"),
                  //             content:
                  //                 Text('Code entered is $verificationCode'),
                  //           );
                  //         });
                  //   }, // end onSubmit
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 55,
                        width: 50,
                        child: TextFormField(
                          controller: _firstController,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(),
                            // hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: 50,
                        child: TextFormField(
                          controller: _secondController,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusColor: Color.fromARGB(255, 207, 207, 207),
                            border: OutlineInputBorder(),
                            // hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: 50,
                        child: TextFormField(
                          controller: _thirdController,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(),
                            // hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: 50,
                        child: TextFormField(
                          controller: _fourthController,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(),
                            // hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: 50,
                        child: TextFormField(
                          controller: _fifthController,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(),
                            // hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: 50,
                        child: TextFormField(
                          controller: _sixthController,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(),
                            // hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // if (validation)
                  //   const Text(
                  //     "*Please fill all OTP digits",
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      key: const ValueKey('btnLogin'),
                      onPressed: () async {
                        String otpCode = _firstController.text +
                            _secondController.text +
                            _thirdController.text +
                            _fourthController.text +
                            _fifthController.text +
                            _sixthController.text;
                        if (_globalkey.currentState!.validate()) {
                          bool verifyOTP = await UserRepository().verifyOTP(
                              otpCode, sendOTPList[1], sendOTPList[0]);

                          if (verifyOTP) {
                            if (sendOTPList[1] == "REGISTER") {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, '/login');
                              // ignore: use_build_context_synchronously
                              displaySuccessMessage(
                                  context, "Verification Success");
                            } else {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, '/resetPassword', arguments: sendOTPList[0]);
                              // ignore: use_build_context_synchronously
                              displaySuccessMessage(
                                  context, "Verification Success");
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            displayErrorMessage(context, "Verification Failed");
                          }
                        }
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            // side: const BorderSide(color: Colors.red),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        "Verify OTP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
