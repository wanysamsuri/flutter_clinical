import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../customshape.dart';
import '../services/api_service.dart';

class FindClinicScreen extends StatefulWidget {
  const FindClinicScreen({Key? key}) : super(key: key);

  @override
  State<FindClinicScreen> createState() => _FindClinicScreenState();
}

class _FindClinicScreenState extends State<FindClinicScreen> {
  Future? futureFetchPanelList;
  @override
  void initState() {
    // TODO: implement initState
    futureFetchPanelList = ApiService().fetchPanelList();
    super.initState();
  }

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
                              height: 60,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nearby clinics are as below:',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FutureBuilder(
                                future: futureFetchPanelList,
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        // gridDelegate:
                                        //     SliverGridDelegateWithFixedCrossAxisCount(
                                        //         crossAxisCount: 2),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                  height: 100,
                                                  margin: EdgeInsets.all(5),
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Column(children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data[index]
                                                                      ['panel']
                                                                      ['name']
                                                                  .toString()
                                                                  .toUpperCase(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold, fontSize: 18),
                                                            ),
                                                            Spacer(),
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          '1.3 km',
                                                                          style:
                                                                              TextStyle(fontSize: 20),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      child: Container(
                                                        child: Column(
                                                          children: [
                                                            Row(children: [
                                                              Text(
                                                                'Address',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Spacer(),
                                                              Row(children: [
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          'Postcode',
                                                                          style:
                                                                              TextStyle(fontSize: 16),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ]),
                                                            ])
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ])));
                                        });
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                })
                            //   Text(
                            //     'Show in map',
                            //     style: TextStyle(
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.blue),
                            //   ),
                            //   SizedBox(
                            //     height: 30,
                            //   ),
                            //   Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 10),
                            //     decoration: BoxDecoration(
                            //       color: secondaryColor,
                            //       // borderRadius: BorderRadius.circular(20)
                            //     ),
                            //     child: TextField(
                            //       enabled: false,
                            //       decoration: InputDecoration(
                            //           contentPadding: EdgeInsets.only(left: 10),
                            //           labelText: 'Poliklinik Dr Hanafi',
                            //           labelStyle: TextStyle(color: Colors.black),
                            //           border: InputBorder.none),
                            //     ),
                            //   ),
                            //   SizedBox(
                            //     height: 10,
                            //   ),
                            //   Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 10),
                            //     decoration: BoxDecoration(
                            //       color: secondaryColor,
                            //       // borderRadius: BorderRadius.circular(20)
                            //     ),
                            //     child: TextField(
                            //       enabled: false,
                            //       decoration: InputDecoration(
                            //           contentPadding: EdgeInsets.only(left: 10),
                            //           labelText: 'Poliklinik Dr Hanafi',
                            //           labelStyle: TextStyle(color: Colors.black),
                            //           border: InputBorder.none),
                            //     ),
                            //   ),
                            //   SizedBox(
                            //     height: 10,
                            //   ),
                            //   Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 10),
                            //     decoration: BoxDecoration(
                            //       color: secondaryColor,
                            //       // borderRadius: BorderRadius.circular(20)
                            //     ),
                            //     child: TextField(
                            //       enabled: false,
                            //       decoration: InputDecoration(
                            //           contentPadding: EdgeInsets.only(left: 10),
                            //           labelText: 'Poliklinik Dr Hanafi',
                            //           labelStyle: TextStyle(color: Colors.black),
                            //           border: InputBorder.none),
                            //     ),
                            //   ),
                            //   SizedBox(
                            //     height: 10,
                            //   ),
                            //   Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 10),
                            //     decoration: BoxDecoration(
                            //       color: secondaryColor,
                            //       // borderRadius: BorderRadius.circular(20)
                            //     ),
                            //     child: TextField(
                            //       enabled: false,
                            //       decoration: InputDecoration(
                            //           contentPadding: EdgeInsets.only(left: 10),
                            //           labelText: 'Poliklinik Dr Hanafi',
                            //           labelStyle: TextStyle(color: Colors.black),
                            //           border: InputBorder.none),
                            //     ),
                            //   ),
                            // ]))),
                          ])))
                    ]))));
  }
}
