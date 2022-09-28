import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/appointment/history_appointment_record.dart';
import 'package:flutter_clinic/screens/appointment/new_appointment_record.dart';

import '../../customshape.dart';
import '../note_screen.dart';
import '../prescription_screen.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 157, 228, 234),
              )),
          centerTitle: true,
          title: const Text('My Appointments'),
        ),
        body: Column(
          children: [
            TabBar(
                indicator: BoxDecoration(
                    color: Color.fromARGB(255, 3, 205, 219),
                    borderRadius: BorderRadius.circular(25)),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'New',
                  ),
                  Tab(
                    text: 'History',
                  ),
                ]),
            Expanded(
                child: TabBarView(children: [
              NewAppointmentRecord(),
              HistoryAppointmentScreen(),
            ]))
          ],
        ),
      ),
    );
  }
}
