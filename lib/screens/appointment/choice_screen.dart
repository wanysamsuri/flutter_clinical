import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/appointment/appointment_form.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../models/appointment_service.dart';

class ChoiceScreen extends StatefulWidget {
  final String serviceName;
  const ChoiceScreen({Key? key, required this.serviceName}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(Adaptive.w(3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.navigate_before,
                    size: 30,
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                  const Text(
                    'Back',
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    widget.serviceName.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
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
                  ListView.separated(
                      shrinkWrap: true,
                      itemCount: 1,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: screenHeight * 0.02,
                        );
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppointmentForm(
                                        // serviceName:
                                        //     appointmentServices[index]
                                        //         .serviceName
                                        //         .toString(),
                                        )));
                          },
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: Icon(Icons.calendar_month),
                                ),
                                SizedBox(
                                  height: Adaptive.h(1),
                                ),
                                Text(
                                  'SCHEDULE YOUR APPOINTMENT',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'from RM100.00/consultation',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
