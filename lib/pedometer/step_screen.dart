import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StepMainScreen extends StatefulWidget {
  const StepMainScreen({super.key});

  @override
  State<StepMainScreen> createState() => _StepMainScreenState();
}

class _StepMainScreenState extends State<StepMainScreen> {
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
            'Step Counter',
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
      bottomNavigationBar: Container(
        child: BottomAppBar(
          color: primaryColor,
          child: InkWell(
            child: Container(
              height: Adaptive.h(6),
              color: Colors.transparent,
              child: Container(
                color: primaryColor,
                child: Center(
                  child: Text(
                    'Record',
                    style: TextStyle(
                      fontSize: 0.27.dp,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Today',
            style: TextStyle(fontSize: 30),
          ),
        ),
      )),
    );
  }
}
