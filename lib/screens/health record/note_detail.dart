import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/health%20record/viewPDF_prescription.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoteDetailScreen extends StatefulWidget {
  final String panelName;
  final String patientName;
  final String nric;
  final String phoneNum;
  final String gender;
  final String date;
  final String description;

  const NoteDetailScreen(
      {Key? key,
      required this.patientName,
      required this.nric,
      required this.phoneNum,
      required this.gender,
      required this.date,
      required this.panelName,
      required this.description})
      : super(key: key);

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 205, 219),
          title: const Text('Notes'),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(Adaptive.w(2)),
            // height: 170.h,
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
                child: Center(
                    child: Container(
              // height: 95.h,
              // height: screenHeight * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Center(
                    child: Container(
                        child: Icon(
                      Icons.medical_information,
                      color: Colors.red,
                    )),
                  ),
                  SizedBox(height: screenHeight * 0.003),
                  Container(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "${widget.panelName}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                      child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(1.5),
                          1: FlexColumnWidth(0.1),
                          2: FlexColumnWidth(3),
                        },
                        // border: TableBorder.all(
                        //     color: Colors.black, style: BorderStyle.solid, width: 2),
                        children: [
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Patient Name',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(':', style: TextStyle(fontSize: 15.0))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.patientName}',
                                      style: TextStyle(fontSize: 15.0))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('IC/Passport',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(':', style: TextStyle(fontSize: 15.0))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.nric}',
                                      style: TextStyle(fontSize: 15.0))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Phone Number',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(':', style: TextStyle(fontSize: 15.0))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.phoneNum}',
                                      style: TextStyle(fontSize: 15.0))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Gender',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(':', style: TextStyle(fontSize: 15.0))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.gender}',
                                      style: TextStyle(fontSize: 15.0))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(':', style: TextStyle(fontSize: 15.0))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.date}',
                                      style: TextStyle(fontSize: 15.0))
                                ]),
                          ]),
                        ],
                      ),
                    ),
                  ])),

                  //details
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Container(
                        // height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight * 0.02),
                              Container(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Notes',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.002),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  widget.description,
                                  textAlign: TextAlign.justify,
                                ),
                              )
                              // Row(
                              //   children: [
                              //     SizedBox(width: 20),
                              //     Container(
                              //         child: RichText(
                              //             text: TextSpan(
                              //                 text: 'Name',
                              //                 style: TextStyle(
                              //                     color: Colors.black,
                              //                     fontSize: 15,
                              //                     fontWeight:
                              //                         FontWeight.bold)))),
                              //     SizedBox(width: 60),
                              //     Container(
                              //         child: RichText(
                              //             text: TextSpan(
                              //                 text: 'Quantity',
                              //                 style: TextStyle(
                              //                     color: Colors.black,
                              //                     fontSize: 15,
                              //                     fontWeight:
                              //                         FontWeight.bold)))),
                              //     SizedBox(width: 60),
                              //     Container(
                              //         child: RichText(
                              //             text: TextSpan(
                              //                 text: 'Dose',
                              //                 style: TextStyle(
                              //                     color: Colors.black,
                              //                     fontSize: 15,
                              //                     fontWeight:
                              //                         FontWeight.bold)))),
                              //   ],
                              // ),

                              // //medicine
                              // Row(
                              //   children: [
                              //     SizedBox(height: 50, width: 20),
                              //     Container(
                              //         child: RichText(
                              //             text: TextSpan(
                              //                 text: 'panadol',
                              //                 style: TextStyle(
                              //                   color: Colors.black,
                              //                   fontSize: 15,
                              //                 )))),
                              //     SizedBox(width: 60),
                              //     Container(
                              //         child: RichText(
                              //             text: TextSpan(
                              //                 text: '6',
                              //                 style: TextStyle(
                              //                   color: Colors.black,
                              //                   fontSize: 15,
                              //                 )))),
                              //     SizedBox(width: 60),
                              //     Container(
                              //         child: RichText(
                              //             text: TextSpan(
                              //                 text: '',
                              //                 style: TextStyle(
                              //                   color: Colors.black,
                              //                   fontSize: 15,
                              //                 )))),
                              //   ],
                              // ),
                            ]),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewPDF_prescription()));
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              right: Adaptive.w(20),
                              left: Adaptive.w(20),
                              bottom: Adaptive.w(10)),
                          // EdgeInsets.symmetric(
                          //     horizontal: screenWidth * 0.15),
                          child: Center(
                            child: Container(
                              height: screenHeight * 0.140,
                              // width: 110,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15),
                                    Container(
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'View Notes in PDF',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 70),
                                    Center(
                                      child: Container(
                                        padding:
                                            EdgeInsetsDirectional.only(top: 10),
                                        child: Image.asset(
                                            "assets/PDF_file_icon.png",
                                            height: 50),
                                      ),
                                    )
                                  ]),
                            ),
                          )))
                ],
              ),
            )))));
  }
}


// SafeArea(
//             child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Center(
//                     child: Container(
//                   height: 700,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(20)),
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 20),
//                       Center(
//                         child: Container(
//                             child: Icon(
//                           Icons.medical_information,
//                           color: Colors.red,
//                         )),
//                       ),
//                       SizedBox(height: 5),
//                       Container(
//                         child: Center(
//                           child: RichText(
//                             text: TextSpan(
//                               text: "${widget.panelName}",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 40),
//                       Container(
//                           child: RichText(
//                               text: TextSpan(
//                                   text: 'Patient Name: ',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold),
//                                   children: [
//                             TextSpan(
//                               text: '${widget.patientName}',
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ]))),
//                       SizedBox(height: 5),
//                       Container(
//                           child: RichText(
//                               text: TextSpan(
//                                   text: 'IC/Passport: ${widget.nric}',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold)))),
//                       SizedBox(height: 5),
//                       Container(
//                           child: RichText(
//                               text: TextSpan(
//                                   text: 'Phone Number: ${widget.phoneNum}',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold)))),
//                       SizedBox(height: 5),
//                       Container(
//                           child: RichText(
//                               text: TextSpan(
//                                   text: 'Gender: ${widget.gender}',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold)))),
//                       SizedBox(height: 5),
//                       RichText(
//                           text: TextSpan(
//                               text: 'Date: ${widget.date}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                               ))),

//                       //details
//                       SizedBox(height: 50),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Center(
//                           child: Container(
//                             height: 200,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(20)),
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 20),
//                                   Container(
//                                     child: Center(
//                                       child: RichText(
//                                         text: TextSpan(
//                                           text: 'Medicine',
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Row(
//                                     children: [
//                                       SizedBox(width: 20),
//                                       Container(
//                                           child: RichText(
//                                               text: TextSpan(
//                                                   text: 'Name',
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.bold)))),
//                                       SizedBox(width: 60),
//                                       Container(
//                                           child: RichText(
//                                               text: TextSpan(
//                                                   text: 'Quantity',
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.bold)))),
//                                       SizedBox(width: 60),
//                                       Container(
//                                           child: RichText(
//                                               text: TextSpan(
//                                                   text: 'Dose',
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.bold)))),
//                                     ],
//                                   ),

//                                   //medicine
//                                   Row(
//                                     children: [
//                                       SizedBox(height: 50, width: 20),
//                                       Container(
//                                           child: RichText(
//                                               text: TextSpan(
//                                                   text: 'panadol',
//                                                   style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 15,
//                                                   )))),
//                                       SizedBox(width: 60),
//                                       Container(
//                                           child: RichText(
//                                               text: TextSpan(
//                                                   text: '6',
//                                                   style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 15,
//                                                   )))),
//                                       SizedBox(width: 60),
//                                       Container(
//                                           child: RichText(
//                                               text: TextSpan(
//                                                   text: '',
//                                                   style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 15,
//                                                   )))),
//                                     ],
//                                   ),
//                                 ]),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 50),
//                       GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ViewPDF()));
//                           },
//                           child: Container(
//                               padding: EdgeInsets.symmetric(horizontal: 10),
//                               child: Center(
//                                 child: Container(
//                                   height: 110,
//                                   width: 110,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(20)),
//                                   padding: EdgeInsets.symmetric(horizontal: 20),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(height: 15),
//                                         Container(
//                                           child: Center(
//                                             child: RichText(
//                                               text: TextSpan(
//                                                 text: 'PDF',
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 70),
//                                         Center(
//                                           child: Container(
//                                             padding: EdgeInsetsDirectional.only(
//                                                 top: 10),
//                                             child: Image.asset(
//                                                 "assets/PDF_file_icon.png",
//                                                 height: 50),
//                                           ),
//                                         )
//                                       ]),
//                                 ),
//                               )))
//                     ],
//                   ),
//                 )
//                 )
//                 )
//                 )
                