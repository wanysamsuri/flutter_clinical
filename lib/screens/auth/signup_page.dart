import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/dashboard.dart';
import 'package:flutter_clinic/screens/home_screen.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nricController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[50],
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Row(children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                  'assets/Clinical-Logo-White.png',
                                  width: Adaptive.w(25),
                                  height: Adaptive.h(3),
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              width: 200,
                              child: Center(
                                child: Text(
                                  "Fill up the form below",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //first name
                          SizedBox(height: 50),
                          Text(
                            'Name',
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
                              controller: _nameController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          //last name
                          SizedBox(height: 15),
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
                            child: TextField(
                              controller: _nricController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          //email
                          SizedBox(height: 15),
                          Text(
                            'Email Address',
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
                              controller: _emailController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          //phone
                          SizedBox(height: 15),
                          Text(
                            'Phone Number',
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
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          //pass
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
                              controller: _passwordController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 34),
                          Center(
                            child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: primaryColor,
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
                                    final isValidForm =
                                        formkey.currentState!.validate();
                                    if (isValidForm) {
                                      ApiService().userRegister(
                                          _nameController.text,
                                          _nricController.text,
                                          _emailController.text,
                                          _phoneController.text,
                                          _passwordController.text,
                                          sharedDeviceName!,
                                          sharedPlayerIdOneSignal!);
                                      // Navigator.of(context)
                                      //     .pushNamed('/dashboard');
                                    }
                                  },
                                  child: Center(
                                    child: Text('Sign Up',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                )),
                          ),

                          SizedBox(height: 30),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/signin_page');
                                      print("HAHAHAHHAHAH");
                                    },
                                    child: Text(' Sign In',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                        )))
                              ],
                            ),
                          )
                        ]))),
          ),
        ));
  }
}
