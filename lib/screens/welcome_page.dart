import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            SizedBox(height: 30),
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image(
                  image: AssetImage("assets/medic.png"),
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
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 3, 219, 183),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(181, 14, 198, 226),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/signin_page');
              },
              child: Center(
                child: Text('Continue as guest',
                    style: TextStyle(color: Colors.blue, fontSize: 20)),
              ),
            )),
          ]),
        ),
      ),
    );
  }
}
