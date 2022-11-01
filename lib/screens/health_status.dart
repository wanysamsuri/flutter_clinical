import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/models/health_status_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../customshape.dart';
import 'appointment/choice_screen.dart';

class HealthStatusScreen extends StatefulWidget {
  const HealthStatusScreen({
    super.key,
  });

  @override
  State<HealthStatusScreen> createState() => _HealthStatusScreenState();
}

class _HealthStatusScreenState extends State<HealthStatusScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Center(
                  child: const Text(
                    'HEALTH STATUS',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: healthStatus.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ChoiceScreen(
                          //               serviceName: healthStatus[index]
                          //                   .serviceName
                          //                   .toString(),
                          //             )));
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
                              (index == 8)
                                  ? Container()
                                  : const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      child:
                                          Icon(Icons.hourglass_empty_outlined),
                                    ),
                              Text(
                                healthStatus[index].serviceName.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Choose',
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
