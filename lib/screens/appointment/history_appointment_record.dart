import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clinic/screens/appointment/queue_new.dart';

class HistoryAppointmentScreen extends StatefulWidget {
  const HistoryAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<HistoryAppointmentScreen> createState() =>
      _HistoryAppointmentScreenState();
}

class _HistoryAppointmentScreenState extends State<HistoryAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 25),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QueueNew()));
                      },
                      child: Container(
                          child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: [
                            Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
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
                                      SizedBox(height: 5),
                                      Divider(thickness: 2),
                                      SizedBox(height: 25),
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
                                    ])),

                            //2
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
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
                                      SizedBox(height: 5),
                                      Divider(thickness: 2),
                                      SizedBox(height: 25),
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
                                    ])),

                            //3
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
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
                                      SizedBox(height: 5),
                                      Divider(thickness: 2),
                                      SizedBox(height: 25),
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
                                    ]))
                          ])))
                ])))));
  }
}
