import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: Adaptive.h(20)),
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image(
                  image: AssetImage("assets/Clinical-Logo-White.png"),
                ),
              ),
            ),
            SizedBox(height: 70),
            Container(
              child: Center(
                child: Text(
                  "CLINIC",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                width: 200,
                child: Center(
                  child: Text(
                    "Running a business is never easy, book with us!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            Column(
              children: [
                Container(
                    // width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
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
                        Navigator.of(context).pushNamed('/signin_page');
                      },
                      child: Center(
                        child: Text('I already have an account',
                            style: TextStyle(fontSize: 18)),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    // width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
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
                        Navigator.of(context).pushNamed('/signup_page');
                      },
                      child: Center(
                        child: Text("I don't have any account",
                            style: TextStyle(fontSize: 18)),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // Container(
            //     child: InkWell(
            //   onTap: () {
            //     Navigator.of(context).pushNamed('/dashboard');
            //   },
            //   child: Center(
            //     child: Text('Continue as guest',
            //         style: TextStyle(color: Colors.blue, fontSize: 20)),
            //   ),
            // )),
          ]),
        ),
      ),
    );
  }
}
