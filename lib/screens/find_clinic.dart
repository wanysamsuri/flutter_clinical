import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../customshape.dart';

class FindClinicScreen extends StatefulWidget {
  const FindClinicScreen({Key? key}) : super(key: key);

  @override
  State<FindClinicScreen> createState() => _FindClinicScreenState();
}

class _FindClinicScreenState extends State<FindClinicScreen> {
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
                // clipper: CustomShape(),
                child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 157, 228, 234),
            )),
            title: const Text(
              'Nearby Clinics',
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
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(Adaptive.w(3)),
                          height: 110.h,
                          child: SingleChildScrollView(
                              child: Column(children: [
                            SizedBox(
                              height: screenWidth * 0.03,
                            ),
                            // SizedBox(
                            //   height: screenHeight * 0.01,
                            // ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    prefixIcon: Icon(Icons.search),
                                    labelText: 'Search',
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Show in map',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                // borderRadius: BorderRadius.circular(20)
                              ),
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    labelText: 'Poliklinik Dr Hanafi',
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                // borderRadius: BorderRadius.circular(20)
                              ),
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    labelText: 'Poliklinik Dr Hanafi',
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                // borderRadius: BorderRadius.circular(20)
                              ),
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    labelText: 'Poliklinik Dr Hanafi',
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                // borderRadius: BorderRadius.circular(20)
                              ),
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    labelText: 'Poliklinik Dr Hanafi',
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none),
                              ),
                            ),
                          ]))),
                    ]))));
  }
}
