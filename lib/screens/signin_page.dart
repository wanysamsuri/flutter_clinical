import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/home_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 246, 249),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 30),
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/medic.png',
                      width: 100, height: 100, fit: BoxFit.fill),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text(
                    "Sign In",
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
              SizedBox(height: 50),
              Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                TextField(
                                    decoration: InputDecoration(
                                  labelText: "Email Address",
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                )),
                                SizedBox(height: 20),
                                TextField(
                                    decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                )),
                                SizedBox(height: 5),
                                Container(
                                    padding: EdgeInsets.only(left: 127),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('/forgot_page');
                                      },
                                      child: Text('Forgot Password',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          )),
                                    )),
                                SizedBox(height: 34),
                                Center(
                                  child: Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(130, 45),
                                          primary:
                                              Color.fromARGB(255, 3, 205, 219)),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Homepage()));
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/signup_page');
                                          },
                                          child: Text(' Sign Up',
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
