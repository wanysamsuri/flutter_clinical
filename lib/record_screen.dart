import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/customshape.dart';
import 'package:flutter_clinic/screens/EMC.dart';
import 'package:flutter_clinic/screens/note_screen.dart';
import 'package:flutter_clinic/screens/prescription_screen.dart';
import 'package:flutter_clinic/screens/referletter.dart';

class HealthRecord extends StatefulWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  State<HealthRecord> createState() => _HealthRecordState();
}

class _HealthRecordState extends State<HealthRecord> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 55,
              backgroundColor: Colors.grey[50],
              elevation: 0.0,
              flexibleSpace: ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 157, 228, 234),
                  )),
              title: const Text('Health Record'),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25)),
                    child: TabBar(
                        indicator: BoxDecoration(
                            color: Color.fromARGB(255, 3, 205, 219),
                            borderRadius: BorderRadius.circular(25)),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'Note',
                          ),
                          Tab(
                            text: 'Prescription',
                          ),
                          Tab(
                            text: 'E-MC',
                          ),
                          Tab(
                            text: 'Letter',
                          ),
                        ]),
                  ),
                  const Expanded(
                      child: TabBarView(children: [
                    Note(),
                    Prescription(),
                    EMC(),
                    ReferLetter()
                  ]))
                ],
              ),
            )));
  }
}
