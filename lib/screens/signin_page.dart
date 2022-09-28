import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/dashboard.dart';

import 'package:flutter_clinic/screens/home_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 211, 246, 249),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
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
                  width: 200,
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
              const SizedBox(height: 50),
              Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //email
                                SizedBox(height: 50),
                                Text(
                                  'Email',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all()),
                                  child: TextField(
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
                                  child: TextField(
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                    padding: const EdgeInsets.only(left: 127),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed('');
                                      },
                                      child: const Text('Forgot Password',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          )),
                                    )),
                                const SizedBox(height: 40),
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
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed('/dashboard');
                                        },
                                        child: Center(
                                          child: Text('Sign In',
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 50),
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
