import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QueueNew extends StatefulWidget {
  const QueueNew({Key? key}) : super(key: key);

  @override
  State<QueueNew> createState() => _QueueNewState();
}

class _QueueNewState extends State<QueueNew> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 157, 228, 234),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(Adaptive.w(5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.navigate_before,
                              size: 30,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            const Text(
                              'Back',
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Center(
                          child: Container(
                              height: 500,
                              width: 380,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(children: [
                                SizedBox(height: 20),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Clinic Name:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)))),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Klinik Dr Hanafi',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)))),
                                SizedBox(height: 30),
                                Center(
                                    child: Container(
                                        height: 150,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey[300],
                                        ),
                                        child: Column(children: [
                                          SizedBox(height: 30),
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: 'Your turn:',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold)))),
                                          SizedBox(height: 20),
                                          Container(
                                              child: Center(
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '0123',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 50,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          )),
                                        ]))),

                                //turn now
                                SizedBox(height: 20),
                                Center(
                                    child: Container(
                                        height: 90,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey[300],
                                        ),
                                        child: Column(children: [
                                          SizedBox(height: 15),
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: 'Turn now:',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold)))),
                                          SizedBox(height: 20),
                                          Container(
                                              child: Center(
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '0121',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          )),
                                        ]))),
                                SizedBox(height: 5),
                                Center(
                                  child: Container(
                                    child: Column(children: [
                                      SizedBox(height: 20),
                                      Container(
                                          child: RichText(
                                              text: TextSpan(
                                                  text:
                                                      'Please wait patiently!',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)))),
                                    ]),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(thickness: 2),
                                SizedBox(height: 10),
                                Container(
                                  child: RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                        text: 'Date: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '23 August 2022',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                        text: 'Time: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '9:45 AM',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ]),
                                  ),
                                ),
                              ]))),
                    ]))));
  }
}
