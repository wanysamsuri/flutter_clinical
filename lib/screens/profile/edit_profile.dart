import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/profile/patient_profile.dart';
import 'package:flutter_clinic/screens/profile/profile_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../customshape.dart';

class EditProfileScreens extends StatefulWidget {
  const EditProfileScreens({Key? key}) : super(key: key);

  @override
  State<EditProfileScreens> createState() => _EditProfileScreensState();
}

class _EditProfileScreensState extends State<EditProfileScreens> {
  Widget textField({required String hintText}) {
    return TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            )));
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: screenHeight * 0.1,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 157, 228, 234),
                )),
            title: const Text('Edit Profile'),
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
        body:
            // FutureBuilder(
            //   future: ApiService(),
            //   child:
            Container(
                padding: EdgeInsets.all(Adaptive.w(4)),
                height: 130.h,
                child: ListView(children: [
                  SizedBox(height: 20),
                  Center(
                    child: Stack(children: [
                      Column(
                        children: [
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          Align(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50,
                              child: Icon(
                                Icons.person_outline,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    //   Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child: Container(
                    //       height: 40,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           width: 4,
                    //           color: Theme.of(context).scaffoldBackgroundColor,
                    //         ),
                    //         color: Colors.green,
                    //       ),
                    //     ),
                    //   )
                    // ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 105,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Name:',
                              style: TextStyle(
                                letterSpacing: 5,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "",
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 105,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'NRIC:',
                              style: TextStyle(
                                letterSpacing: 5,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "",
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 105,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'E-mail:',
                              style: TextStyle(
                                letterSpacing: 5,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "",
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          Row(children: [
                            SizedBox(width: 40),
                            Container(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(130, 45),
                                      primary: Color.fromARGB(255, 255, 30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PatientProfileScreen()));
                                    })),
                            SizedBox(width: 50),
                            Row(
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(130, 45),
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    child: Text(
                                      'Save Edit',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Profile()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ])));
  }
}
