import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/dashboard.dart';

import 'package:flutter_clinic/screens/home_screen.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController nricController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 211, 246, 249),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Adaptive.w(11)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 30),
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/medic.png',
                      width: 100, height: 100, fit: BoxFit.fill),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
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
              SizedBox(height: Adaptive.h(3)),
              Column(
                children: [
                  Container(
                      // height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                          padding: EdgeInsets.all(Adaptive.w(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //email

                                Text(
                                  'NRIC',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all()),
                                  child: TextFormField(
                                    controller: nricController,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),

                                //password
                                SizedBox(height: 15),
                                Text(
                                  'Password',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all()),
                                  child: TextFormField(
                                    controller: passwordController,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: Adaptive.w(31)),
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
                                        color: Color.fromARGB(255, 3, 205, 219),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          // Navigator.of(context)
                                          //     .pushNamed('/dashboard');

                                          ApiService().userLogin(
                                              nricController.text,
                                              passwordController.text,
                                              '',
                                              '');
                                        },
                                        child: Center(
                                          child: Text('Sign In',
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                      )),
                                ),
                                SizedBox(height: Adaptive.w(10)),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/signup_page');
                                          },
                                          child: const Text(' Sign Up',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18,
                                              )))
                                    ],
                                  ),
                                )
                              ])))
                ],
              ),
            ]),
          ),
        ));
  }
}
