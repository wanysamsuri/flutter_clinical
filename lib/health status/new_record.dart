import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/health%20status/health_status.dart';
import 'package:flutter_clinic/health%20status/view_self_test_screens.dart';
import 'package:flutter_clinic/models/appointment_service.dart';
import 'package:flutter_clinic/models/health_choice.dart';
import 'package:flutter_clinic/models/health_status_model.dart';
import 'package:flutter_clinic/screens/appointment/choice_screen.dart';
import 'package:flutter_clinic/screens/profile/help_faq.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../screens/notification/view_noti.dart';
import '../services/api_service.dart';

class NewRecordScreen extends StatefulWidget {
  const NewRecordScreen({super.key});

  @override
  State<NewRecordScreen> createState() => _NewRecordScreenState();
}

class _NewRecordScreenState extends State<NewRecordScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _resultController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();

  TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 00);
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value ?? TimeOfDay.now();
      });
    });
  }

  // DateTime _dateTime = DateTime.now();
  // void _showDatePicker() {
  //   showDatePicker(
  //           context: context,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime(2020),
  //           lastDate: DateTime(2030))
  //       .then((value) {
  //     setState(() {
  //       _date.text = DateFormat('dd-MM-yyyy').format(_dateTime);
  //     });
  //   });
  // }

  TextEditingController _date = TextEditingController();
  TextEditingController _time = TextEditingController();

  String dropdownvalue = 'Choose';

  // List of items
  var items = [
    'Choose',
    '1',
    '2',
  ];
  @override
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
            'Add Records',
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
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: Adaptive.h(2),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: Adaptive.h(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Adaptive.w(30),
                          height: Adaptive.h(5),
                          // color: primaryColor,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor)),
                          // decoration: BoxDecoration(
                          //     border: Border(
                          //         bottom: BorderSide(
                          //             width: 1, color: Colors.grey))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  child: Icon(Icons.calendar_today_rounded)),
                              Container(
                                child: Text(
                                  _date.text,
                                  // .format(context).toString(),
                                  style: TextStyle(
                                    fontSize: 0.25.dp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(20240));
                              if (pickeddate != null) {
                                setState(() {
                                  _date.text = DateFormat('dd-MM-yyyy')
                                      .format(pickeddate);
                                });
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Select Date'),
                            ),
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Adaptive.h(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Adaptive.w(30),
                          height: Adaptive.h(5),
                          // color: primaryColor,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor)),
                          // decoration: BoxDecoration(
                          //     border: Border(
                          //         bottom: BorderSide(
                          //             width: 1, color: Colors.grey))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(child: Icon(Icons.timer_sharp)),
                              Container(
                                child: Text(
                                  _timeOfDay.format(context).toString(),
                                  style: TextStyle(
                                    fontSize: 0.25.dp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: _showTimePicker,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Select Time'),
                            ),
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Adaptive.h(2),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: Adaptive.h(2),
                    ),
                    Text(''),
                    TextFormField(
                      controller: _nameController,
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 0.25.dp),
                      decoration: InputDecoration(
                        hintText: "Name",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.h(2),
                    ),
                    TextFormField(
                      controller: _typeController,
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 0.25.dp),
                      decoration: InputDecoration(
                        hintText: "Type",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.h(2),
                    ),
                    TextFormField(
                      controller: _resultController,
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 0.25.dp),
                      decoration: InputDecoration(
                        hintText: "Result",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.h(2),
                    ),
                    TextFormField(
                      controller: _remarksController,
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 0.25.dp),
                      decoration: InputDecoration(
                        hintText: "Remarks",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Adaptive.h(10),
              ),
              Center(
                child: Container(
                  height: Adaptive.h(5),
                  width: Adaptive.w(60),
                  child: ElevatedButton(
                    onPressed: () async {
                      ApiService().userTestResult(
                          _nameController.text,
                          _typeController.text,
                          _resultController.text,
                          _remarksController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        primary: primaryColor),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ]))),
      ),
    );
  }
}
