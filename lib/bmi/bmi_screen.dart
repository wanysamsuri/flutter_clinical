import 'dart:math';

import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/bmi/age_weight.dart';
import 'package:flutter_clinic/bmi/gender_widget.dart';
import 'package:flutter_clinic/bmi/height.dart';
import 'package:flutter_clinic/bmi/score.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/main.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  int currentindex = 0;
  int _gender = 0;
  int _height = 0;
  int _age = 25;
  int _weight = 50;
  String result = '';
  double height = 0;
  double weight = 0;
  bool _isFinished = false;
  double _bmiScore = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  final _scrollController = FixedExtentScrollController();

  static const double _itemHeight = 60;
  static const int _itemCount = 100;

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
                //clipper: CustomShape(),
                child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 157, 228, 234),
            )),
            title: const Text(
              'Body Mass Index (BMI)',
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Card(
              color: Colors.grey[100],
              elevation: 5,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                GenderWidget(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                HeightWidget(onChange: (heightVal) {
                  _height = heightVal;
                }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => showCupertinoModalPopup(
                              // barrierColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 250,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Spacer(),
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text(
                                                'Select',
                                                style: TextStyle(fontSize: 17),
                                              ))
                                        ],
                                      ),
                                      Container(
                                        height: 100,
                                        child: CupertinoPicker.builder(
                                            // backgroundColor: Colors.white,
                                            itemExtent: 30,
                                            scrollController:
                                                FixedExtentScrollController(
                                                    initialItem: _age),
                                            onSelectedItemChanged:
                                                (int ageValue) {
                                              setState(() {
                                                _age = ageValue;
                                              });
                                            },
                                            childCount: 200,
                                            itemBuilder: (context, index) {
                                              return Text(index.toString());
                                            }),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          child: Card(
                              elevation: 12,
                              shape: const RoundedRectangleBorder(),
                              child: Column(children: [
                                Text(
                                  'Age',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        _age.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Icon(Icons.arrow_drop_down_circle)
                                    ],
                                  ),
                                )
                              ])),
                        )),

                    // AgeWeightWidget(
                    //     onChange: (ageVal) {
                    //       _age = ageVal;
                    //     },
                    //     title: 'Age',
                    //     initValue: 25,
                    //     min: 0,
                    //     max: 200),
                    SizedBox(
                      width: 40,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 250,
                                  width: double.infinity,
                                  child: CupertinoPicker.builder(
                                      backgroundColor: Colors.white,
                                      itemExtent: 30,
                                      scrollController:
                                          FixedExtentScrollController(
                                              initialItem: _weight),
                                      onSelectedItemChanged: (int weightValue) {
                                        setState(() {
                                          _weight = weightValue;
                                        });
                                      },
                                      childCount: 200,
                                      itemBuilder: (context, index) {
                                        return Text(index.toString());
                                      }),
                                );
                              }),
                          child: Card(
                              elevation: 12,
                              shape: const RoundedRectangleBorder(),
                              child: Column(children: [
                                Text(
                                  'Weight (kg)',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        _weight.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Icon(Icons.arrow_drop_down_circle)
                                    ],
                                  ),
                                )
                              ])),
                        )),

                    // AgeWeightWidget(
                    //     onChange: (weightVal) {
                    //       _weight = weightVal;
                    //     },
                    //     title: 'Weight (kg)',
                    //     initValue: 50,
                    //     min: 0,
                    //     max: 1000),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                child: ScoreScreen(
                                  bmiScore: _bmiScore,
                                  age: _age,
                                ),
                                type: PageTransitionType.fade));

                        setState(() {
                          _isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        //Calculate BMI here
                        calculateBmi();

                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      activeColor: primaryColor,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      buttonText: "CALCULATE"),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ),

          //         child: Padding(
          //       padding: EdgeInsets.all(12),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             children: [
          //               radioButton('Man', Colors.blue, 0),
          //               radioButton('Woman', Colors.pink, 1),
          //             ],
          //           ),

          //           //height
          //           SizedBox(
          //             height: 40,
          //           ),
          //           Text(
          //             'Your height in cm',
          //             style: TextStyle(
          //               fontSize: 18,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           TextField(
          //             keyboardType: TextInputType.number,
          //             controller: heightController,
          //             textAlign: TextAlign.center,
          //             decoration: InputDecoration(
          //                 hintText: 'Your height in cm',
          //                 filled: true,
          //                 fillColor: Colors.grey[200],
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(8),
          //                   borderSide: BorderSide.none,
          //                 )),
          //           ),
          //           //weight
          //           SizedBox(
          //             height: 40,
          //           ),
          //           Text(
          //             'Your weight in kg',
          //             style: TextStyle(
          //               fontSize: 18,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           TextField(
          //             keyboardType: TextInputType.number,
          //             controller: weightController,
          //             textAlign: TextAlign.center,
          //             decoration: InputDecoration(
          //                 hintText: 'Your weight in kg',
          //                 filled: true,
          //                 fillColor: Colors.grey[200],
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(8),
          //                   borderSide: BorderSide.none,
          //                 )),
          //           ),
          //           SizedBox(
          //             height: 40,
          //           ),
          //           Container(
          //             height: 50,
          //             width: double.infinity,
          //             child: ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   height = double.parse(heightController.value.text);
          //                   weight = double.parse(weightController.value.text);
          //                 });

          //                 calculateBmi(height, weight);
          //               },
          //               // color: primaryColor,
          //               child: Text(
          //                 'Calculate',
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 40,
          //           ),
          //           Container(
          //             width: double.infinity,
          //             child: Text(
          //               'Your BMI is:',
          //               textAlign: TextAlign.center,
          //               style: TextStyle(fontSize: 18),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 40,
          //           ),
          //           Container(
          //             width: double.infinity,
          //             child: Text(
          //               '$result',
          //               textAlign: TextAlign.center,
          //               style: TextStyle(fontSize: 40),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),
          //   );
          // }

          // void calculateBmi(double height, double weight) {
          //   double finalresult = weight / (height * height / 10000);
          //   String bmi = finalresult.toStringAsFixed(2);
          //   setState(() {
          //     result = bmi;
          //   });
          // }

          // void changeIndex(int index) {
          //   setState(() {
          //     currentindex = index;
          //   });
          // }

          // Widget radioButton(String value, Color color, int index) {
          //   return Expanded(
          //       child: Container(
          //     height: 80,
          //     margin: EdgeInsets.symmetric(horizontal: 12),
          //     child: TextButton(
          //       // color: currentindex == index ? color : Colors.grey[200],
          //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //       onPressed: () {
          //         changeIndex(index);
          //       },
          //       child: Text(
          //         value,
          //         style: TextStyle(
          //           color: currentindex == index ? Colors.white : color,
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
        ));
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }

  Widget _child(int index) {
    return SizedBox(height: _itemHeight, child: Text('$index'));
  }
}
