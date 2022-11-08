import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewStatusScreen extends StatefulWidget {
  const ViewStatusScreen({super.key});

  @override
  State<ViewStatusScreen> createState() => _ViewStatusScreenState();
}

class _ViewStatusScreenState extends State<ViewStatusScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: screenHeight * 0.07,
            backgroundColor: Colors.grey[50],
            elevation: 0.0,
            flexibleSpace: ClipPath(
                //clipper: CustomShape(),
                child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 157, 228, 234),
            )),
            title: const Text(
              'Measurement',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(Adaptive.w(4)),
                height: 200.h,
                child: Center(
                    child: Container(
                        height: Adaptive.h(30),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey, //New
                                blurRadius: 10.0,
                                offset: Offset(-5, -5))
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Center(
                                child: Container(
                                    child: Icon(
                                  Icons.bloodtype,
                                  color: Colors.red,
                                )),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Test',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              Container(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Patient Name:',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)))),
                              SizedBox(height: 5),
                              Container(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Date:',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)))),
                              SizedBox(height: 5),
                              // Container(
                              //     child: RichText(
                              //         text: TextSpan(
                              //             text: 'Phone Number:',
                              //             style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 15,
                              //                 fontWeight: FontWeight.bold)))),
                            ]))))));
  }
}
