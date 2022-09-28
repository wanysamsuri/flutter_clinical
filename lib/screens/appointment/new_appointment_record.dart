import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class NewAppointmentRecord extends StatefulWidget {
  const NewAppointmentRecord({Key? key}) : super(key: key);

  @override
  State<NewAppointmentRecord> createState() => _NewAppointmentRecordState();
}

class _NewAppointmentRecordState extends State<NewAppointmentRecord> {
  @override
  Widget build(BuildContext context) {
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
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(173, 0, 222, 7),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Container(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Poliklinik Shah Alam',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                      child: RichText(
                                          text: TextSpan(
                                    text: 'Date:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ))),
                                  SizedBox(height: 5),
                                  Container(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Time:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ]),
                  ),
                ])))));
  }
}
