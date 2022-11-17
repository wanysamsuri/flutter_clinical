import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/profile/terms_condition.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../services/api_service.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _messageController = TextEditingController();
  String dropdownvalue = 'Feedback';

  // List of items
  var items = [
    'Feedback',
    'Complaint',
  ];
  double value = 5;
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
              'Feedback',
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
              },
            )),
        body: SafeArea(
            child: SingleChildScrollView(
                // physics: BouncingScrollPhysics(),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Container(
                padding: EdgeInsets.all(Adaptive.w(5)),
                height: Adaptive.h(12),
                width: Adaptive.w(100),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 157, 228, 234),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "How was your experience at MyClinical?",
                          style: TextStyle(
                              fontSize: 0.26.dp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: Adaptive.h(1),
                      ),
                      Center(
                        child: RatingStars(
                          value: value,
                          onValueChanged: (v) {
                            //
                            setState(() {
                              value = v;
                            });
                          },
                          starBuilder: (index, color) => Icon(
                            Icons.star,
                            color: color,
                          ),
                          starCount: 5,
                          starSize: 30,
                          valueLabelColor: const Color(0xff9b9b9b),
                          valueLabelTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          valueLabelRadius: 10,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: true,
                          valueLabelVisibility: true,
                          animationDuration: Duration(milliseconds: 1000),
                          valueLabelPadding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.yellowAccent,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: Adaptive.h(3),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton(
                        value: dropdownvalue,
                        dropdownColor: Colors.grey[200],
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        underline: SizedBox(),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.h(3),
                    ),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 0.25.dp),
                      decoration: InputDecoration(
                        hintText: "Type your message here",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.h(3),
                    ),
                    Container(
                      height: Adaptive.h(5),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          ApiService().userFeedback(_messageController.text);
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
                  ],
                ),
              ),
            ])))));
  }
}
