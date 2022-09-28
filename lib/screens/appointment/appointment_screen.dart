import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/models/appointment_service.dart';
import 'package:flutter_clinic/screens/appointment/choice_screen.dart';

import '../../constant.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
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
              const Text(
                'SERVICES',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              const Text(
                'Select a specialty',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: appointmentServices.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoiceScreen(
                                      serviceName: appointmentServices[index]
                                          .serviceName
                                          .toString(),
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
                            (index == 0)
                                ? Container()
                                : const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: FlutterLogo(size: 30),
                                  ),
                            Text(
                              appointmentServices[index].serviceName.toString(),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'from RM100.00/consultation',
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
    );
  }
}
