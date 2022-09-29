import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/health%20record/viewPDF_emc.dart';
import 'package:flutter_clinic/screens/health%20record/viewPDF_prescription.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EMC_2 extends StatefulWidget {
  const EMC_2({Key? key}) : super(key: key);

  @override
  State<EMC_2> createState() => _EMC_2State();
}

class _EMC_2State extends State<EMC_2> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 157, 228, 234),
          title: const Text('Medical Certificate'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                    child: Container(
                  height: 700,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                            child: Icon(
                          Icons.medical_information,
                          color: Colors.red,
                        )),
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Poliklinik Dr Hanafi',
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
                                  text: 'IC/Passport:',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)))),
                      SizedBox(height: 5),
                      Container(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Phone Number:',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)))),
                      SizedBox(height: 5),
                      Container(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Gender:',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)))),
                      SizedBox(height: 5),
                      RichText(
                          text: TextSpan(
                              text: 'Date:',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ))),

                      //details
                      SizedBox(height: 50),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Container(
                            height: 230,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Container(
                                    child: Center(
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Medical Certificate',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Divider(thickness: 2),
                                  SizedBox(height: 5),
                                  // SizedBox(width: 20),
                                  Container(
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        text:
                                            'The above name person came to our clinic today and was found to have ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' DIARHEA.',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          TextSpan(
                                            text:
                                                ' She/He is unfit to attend her/his present duty for day(s) from:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      child: RichText(
                                          text: TextSpan(
                                              text: 'Start:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                  SizedBox(height: 5),
                                  Container(
                                      child: RichText(
                                          text: TextSpan(
                                              text: 'Till:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                ]),
                          ),
                        ),
                      ),

                      SizedBox(height: 50),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => viewPDF_EMC()));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15),
                                        Container(
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'PDF',
                                                style: TextStyle(
                                                  color: Colors.black,
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
                                            padding: EdgeInsetsDirectional.only(
                                                top: 10),
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
