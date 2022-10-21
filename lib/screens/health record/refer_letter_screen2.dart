import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/health%20record/viewPDF_emc.dart';
import 'package:flutter_clinic/screens/health%20record/viewPDF_prescription.dart';
import 'package:flutter_clinic/screens/health%20record/viewPDF_refer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReferLetter2 extends StatefulWidget {
  const ReferLetter2({Key? key}) : super(key: key);

  @override
  State<ReferLetter2> createState() => _ReferLetter2State();
}

class _ReferLetter2State extends State<ReferLetter2> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 157, 228, 234),
          title: const Text('Refer Letter'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(Adaptive.w(4)),
                height: 130.h,
                child: Center(
                    child: Container(
                  height: 600,
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
                            height: 150,
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
                                          text: 'Refer Letter',
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
                                        text: 'Referral reason:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      child: RichText(
                                          text: TextSpan(
                                              text: '- DIARHEA',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              )))),
                                  SizedBox(height: 2),
                                  Container(
                                      child: RichText(
                                          text: TextSpan(
                                              text: '- Low BP',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              )))),
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
                                    builder: (context) => viewPDF_Refer()));
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
