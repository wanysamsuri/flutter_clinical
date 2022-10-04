import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clinic/models/new_appointment_model.dart';
import 'package:flutter_clinic/screens/appointment/queue_new.dart';

class NewAppointmentRecord extends StatefulWidget {
  const NewAppointmentRecord({Key? key}) : super(key: key);

  @override
  State<NewAppointmentRecord> createState() => _NewAppointmentRecordState();
}

class _NewAppointmentRecordState extends State<NewAppointmentRecord>
    with TickerProviderStateMixin {
  late List<GlobalKey> expansionTile;
  int selected = -1;
  final List<NewAppointment> items = [];

  @override
  Widget build(BuildContext context) {
    var snapshot;
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 25),
          Container(
            child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        SizedBox(height: 20),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QueueNew()));
                            },
                            child: Container(
                                height: 150,
                                width: 500,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(173, 0, 222, 7),
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
                                    ])))
                      ]
                          // Container(
                          //   child: Center(
                          //     child: RichText(
                          //       text: TextSpan(
                          //         text: 'Poliklinik Dr Hanafi',
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.black,
                          //           fontSize: 18,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // Divider(thickness: 2),
                          // //SizedBox(height: 5),
                          // SizedBox(height: 25),
                          // Container(
                          //   child: RichText(
                          //     textAlign: TextAlign.justify,
                          //     text: TextSpan(
                          //         text: 'Date: ',
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15,
                          //         ),
                          //         children: <TextSpan>[
                          //           TextSpan(
                          //             text: '23 August 2022',
                          //             style: TextStyle(
                          //                 color: Colors.black,
                          //                 fontSize: 15),
                          //           ),
                          //         ]),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // Container(
                          //   child: RichText(
                          //     textAlign: TextAlign.justify,
                          //     text: TextSpan(
                          //         text: 'Time: ',
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15,
                          //         ),
                          //         children: <TextSpan>[
                          //           TextSpan(
                          //             text: '9:45 AM',
                          //             style: TextStyle(
                          //                 color: Colors.black,
                          //                 fontSize: 15),
                          //           ),
                          //         ]),
                          //   ),
                          // ),
                          ))
                ]),
          ),
        ]),
      ),
    )));
  }
}
