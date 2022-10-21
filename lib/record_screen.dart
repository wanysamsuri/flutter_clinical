import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/customshape.dart';
import 'package:flutter_clinic/screens/health%20record/EMC_screen.dart';
import 'package:flutter_clinic/screens/health%20record/note_screen.dart';
import 'package:flutter_clinic/screens/health%20record/prescription_screen.dart';
import 'package:flutter_clinic/screens/health%20record/refer_letter_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';

class HealthRecord extends StatefulWidget {
  final String orderId;
  const HealthRecord({Key? key, required this.orderId}) : super(key: key);

  @override
  State<HealthRecord> createState() => _HealthRecordState();
}

class _HealthRecordState extends State<HealthRecord>
    with SingleTickerProviderStateMixin {
  // Future? futureFetchSingleRecord;
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    // futureFetchSingleRecord =
    //     ApiService().fetchSinglePanelRecord(widget.orderId);
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          // toolbarHeight: screenHeight * 0.1,
          // backgroundColor: Colors.grey[50],
          // elevation: 0.0,
          // flexibleSpace: ClipPath(
          //     clipper: CustomShape(),
          //     child: Container(
          //       height: 200,
          //       width: MediaQuery.of(context).size.width,
          //       color: Color.fromARGB(255, 3, 205, 219),
          //     )),
          backgroundColor: Color.fromARGB(255, 157, 228, 234),
          title: const Text('Health Record'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(horizontal: 25.0),
                    indicator: BoxDecoration(
                        color: Color.fromARGB(255, 3, 205, 219),
                        borderRadius: BorderRadius.circular(25)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Note',
                      ),
                      Container(
                        child: Tab(
                          text: 'Prescription',
                        ),
                      ),
                      Tab(
                        text: 'E-MC',
                      ),
                      Tab(
                        text: 'Refferal Letter',
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  Note(orderId: widget.orderId,),
                  Prescription(
                    orderId: widget.orderId,
                  ),
                  EMC(),
                  ReferLetter()
                ]),
              )
            ],
          ),
        ));
  }
}
