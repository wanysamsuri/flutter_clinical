import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/dashboard.dart';

import 'package:flutter_clinic/screens/home_screen.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  String NRIC = '';
  String password = '';
  TextEditingController nricController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: secondaryColor,
        body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(6)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Adaptive.h(4)),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/Clinical-Logo-White.png',
                              fit: BoxFit.fill,
                              height: Adaptive.h(3),
                              width: Adaptive.w(30)),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(1)),
                      Center(
                        child: Container(
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(4)),
                      Center(
                        child: Container(
                          // width: 200,
                          width: Adaptive.w(50),
                          child: const Center(
                            child: Text(
                              "Sign In to access your account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(4)),
                      Container(

                          // height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 2.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ]),
                          child: Container(
                              padding: EdgeInsets.all(Adaptive.w(10)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //nric
                                    Text(
                                      'NRIC',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      obscureText: false,
                                      controller: nricController,
                                      style: TextStyle(fontSize: 20),
                                      // keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))
                                          // border: InputBorder.none,
                                          ),
                                      // validator: (NRIC) => NRIC != null &&
                                      //         !EmailValidator.validate(NRIC)
                                      //     ? 'Enter a valid IC No.'
                                      //     : null,

                                      validator: (value) {
                                        if (value != null &&
                                            value.length < 12) {
                                          return 'Enter a valid IC No. Numbers only';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),

                                    //password
                                    SizedBox(height: 30),
                                    Text(
                                      'Password',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                        obscureText: isHiddenPassword,
                                        controller: passwordController,
                                        style: TextStyle(fontSize: 20),
                                        decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                              onTap: _togglePasswordView,
                                              child: Icon(Icons.visibility),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                              20,
                                            ))),
                                        validator: (value) {
                                          if (value != null &&
                                              value.length < 8) {
                                            return 'Enter min. 8 characters';
                                          } else {
                                            return null;
                                          }
                                        }),
                                    const SizedBox(height: 5),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: Adaptive.w(31)),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed('');
                                          },
                                          child: const Text('Forgot Password',
                                              style: TextStyle(
                                                color: Colors.blue,
                                              )),
                                        )),
                                    SizedBox(height: Adaptive.h(3)),
                                    Center(
                                      child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 3, 205, 219),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.0), //(x,y)
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              final isValidForm = formkey
                                                  .currentState!
                                                  .validate();
                                              if (isValidForm) {
                                                // Navigator.of(context)
                                                //     .pushAndRemoveUntil(
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           HomeScreen()),
                                                //   (route) => false,
                                                // );
                                                // Navigator.of(context)
                                                //     .pushNamed('/dashboard');

                                                ApiService().userLogin(
                                                    nricController.text,
                                                    passwordController.text,
                                                    sharedDeviceName!,
                                                    sharedPlayerIdOneSignal!);
                                              }
                                            },
                                            child: Center(
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          )),
                                    ),
                                    SizedBox(height: Adaptive.w(10)),
                                    // Center(
                                    //   child: Column(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     children: <Widget>[
                                    //       const Text(
                                    //         "Don't have an account?",
                                    //         style: TextStyle(
                                    //           color: Colors.black,
                                    //           fontSize: 18,
                                    //         ),
                                    //       ),
                                    //       const SizedBox(height: 10),
                                    //       InkWell(
                                    //           onTap: () {
                                    //             Navigator.of(context)
                                    //                 .pushNamed(
                                    //                     '/signup_page');
                                    //           },
                                    //           child: const Text(' Sign Up',
                                    //               style: TextStyle(
                                    //                 color: Colors.blue,
                                    //                 fontSize: 18,
                                    //               )))
                                    //     ],
                                    //   ),
                                    // )
                                  ]))),
                      SizedBox(height: Adaptive.h(3)),
                    ]),
              ),
            )));
  }

  void _togglePasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else  {
    //   isHiddenPassword = true;
    // }
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
