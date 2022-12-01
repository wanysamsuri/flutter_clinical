import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/auth/kyc_otp.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  bool hasError = false;
  String currentText = "";
  bool selected = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    // errorController!.close();
    // textEditingController.dispose();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  const SizedBox(height: 5),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Lottie.asset('assets/email_verify.json'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Email Code Verification',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child:
                        // (selected == false)
                        //     ? TextButton(
                        //         onPressed: () {
                        //           setState(() {
                        //             // APIService().fetchEmailOTP();
                        //             selected = true;
                        //           });
                        //         },
                        //         child: Text('Get Code'))
                        //     :
                        RichText(
                      maxLines: 3,
                      textScaleFactor: 1.05,
                      text: TextSpan(
                          text:
                              "Enter the code sent to $sharedEmail. Request resend code if you didn;t get the code within 3 minutes.",
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 15)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RichText(
                        text: TextSpan(
                            text: 'Time Remaining: ',
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 15),
                            children: [
                          TextSpan(
                              text: '02:57',
                              style: TextStyle(color: Colors.green))
                        ])),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscuringWidget:
                              Image.asset("assets/clinical_my.png", scale: 10),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 6) {
                              return "Complete the code";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            selectedFillColor: Colors.white,
                            selectedColor: primaryColor,
                            inactiveFillColor: primaryColor,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  (selected == false)
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't receive the code?",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                // APIService().fetchEmailOTP();
                              },
                              child: const Text(
                                "RESEND",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                  const SizedBox(
                    height: 14,
                  ),
                  RoundedLoadingButton(
                    errorColor: Colors.red,
                    successColor: Colors.green,
                    valueColor: Colors.white,
                    borderRadius: 20,
                    color: primaryColor,
                    controller: _btnController,
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 6) {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                        _btnController.reset();
                      } else {
                        setState(
                          () {
                            hasError = false;
                            _btnController.success();
                            Timer(const Duration(seconds: 3), () {
                              // ApiService().postEmailOTP(currentText);
                              _btnController.reset();
                              // Navigator.pushNamed(
                              //     context, smsCodeEmailVerification);
                              Get.to(() => OTPVerification());
                            });
                          },
                        );
                      }
                    },
                    child: const Text('Verify Email',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 10,
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
