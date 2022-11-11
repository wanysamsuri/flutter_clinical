import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/profile/help_faq.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../services/api_service.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

Future? futurefetchFeedback;
int selected = -1;

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  void initState() {
    futurefetchFeedback = ApiService().fetchHighlight();
    super.initState();
  }

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
            'Terms & Conditions',
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
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(Adaptive.w(2)),
          height: 130.h,
          child: SafeArea(
            child: FutureBuilder(
              future: ApiService().fetchHighlight(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.all(Adaptive.w(2)),
                    height: 130.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.0, vertical: 10),

                                      //body listview
                                      child: Container(
                                        height: Adaptive.h(40),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey, //New
                                                blurRadius: 10.0,
                                                offset: Offset(-1, -1))
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 1,
                                            ),
                                            ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, bottom: 5),
                                                    child: Center(
                                                      child: Text(
                                                        (snapshot.data[index]
                                                            ['title']),
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          // fontWeight:
                                                          //     FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // subtitle: Column(
                                              //   crossAxisAlignment:
                                              //       CrossAxisAlignment.start,
                                              //   children: [
                                              //     Padding(
                                              //       padding:
                                              //           const EdgeInsets.only(
                                              //               bottom: 5.0),
                                              //       child: Text(
                                              //         (snapshot.data[index]
                                              //             ['created_at']),
                                              //         textAlign:
                                              //             TextAlign.justify,
                                              //         style: TextStyle(
                                              //           fontSize: 12,
                                              //           color: Colors.black,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }))
                        ]),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
