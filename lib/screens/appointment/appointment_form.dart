import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant.dart';

// List<Widget> services = <Widget>[
//   Text('Doctor - Home Visit'),
//   Text('Doctor - Video Consultation'),
//   Text('Nurse - Home Visit')
// ];

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({Key? key}) : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  // final List<bool> _selectedServices = <bool>[true, false, false];
  int selected = 0;

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (selected == index) ? Colors.blue : Colors.grey,
        ),
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              'Appointment Request',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            leading: GestureDetector(
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(Adaptive.w(3)),
              height: Adaptive.h(90),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Text(
                      'Schedule an appointment',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      //margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Now'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      //margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Select your location'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            const Text(
                              'Select a patient',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Container(
                              //margin: EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 20),
                                      Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Patient'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Container(
                                // margin: EdgeInsets.all(10),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 295,
                                          // width: MediaQuery.of(context).size.width,
                                          height: 80,

                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 5,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: Adaptive.h(30),
                                                  margin: const EdgeInsets.only(
                                                      right: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color.fromARGB(255,
                                                              113, 112, 112)
                                                          .withOpacity(0.2)),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0,
                                                          left: 8.0),
                                                  child: const Center(
                                                    child: Text(
                                                      'Add a symptom',
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  const Text(
                                    'Type of service',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customRadio("Doctor - Home Visit", 1),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        customRadio(
                                            "Doctor - Video Consultation", 2),
                                      ],
                                    ),
                                  )

                                  // ToggleButtons(
                                  //   onPressed: (int index) {
                                  //     setState(() {
                                  //       // The button that is tapped is set to true, and the others to false.
                                  //       for (int i = 0;
                                  //           i < _selectedServices.length;
                                  //           i++) {
                                  //         _selectedServices[i] = i == index;
                                  //       }
                                  //     });
                                  //   },
                                  //   borderRadius:
                                  //       const BorderRadius.all(Radius.circular(8)),
                                  //   selectedBorderColor: primaryColor,
                                  //   selectedColor: Colors.black,
                                  //   fillColor: secondaryColor,
                                  //   color: Colors.black,
                                  //   constraints: const BoxConstraints(
                                  //     minHeight: 60.0,
                                  //     minWidth: 110.0,
                                  //   ),
                                  //   isSelected: _selectedServices,
                                  //   children: services,
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customRadio("Nurse - Home Visit", 3),
                                ],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          width: 400,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 3, 205, 219),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: InkWell(
                            // onTap: () {
                            //   Navigator.of(context).pushNamed('');
                            // },
                            child: Center(
                              child:
                                  Text('Next', style: TextStyle(fontSize: 20)),
                            ),
                          )),
                    ),
                  ])),
        )));
  }
}
