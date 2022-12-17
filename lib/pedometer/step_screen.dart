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
        // bottomNavigationBar: Container(
        //   child: BottomAppBar(
        //     color: primaryColor,
        //     child: InkWell(
        //       child: Container(
        //         height: Adaptive.h(6),
        //         color: Colors.transparent,
        //         child: Container(
        //           color: primaryColor,
        //           child: Center(
        //             child: Text(
        //               'Record',
        //               style: TextStyle(
        //                 fontSize: 0.27.dp,
        //                 // fontWeight: FontWeight.bold
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       onTap: () {},
        //     ),
        //   ),
        // ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          icon: const Icon(Icons.add, color: Colors.black),
          label: const Text(
            'Record',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: primaryColor,
          onPressed: () {},
          // shape: BeveledRectangleBorder(
          //     borderRadius: BorderRadius.circular(5),
          //     side: const BorderSide(color: Colors.grey)
          //     ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Today',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    height: Adaptive.h(18),
                    width: screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300]),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  child: Text('Steps'),
                                ),
                              ),
                              Container(
                                child: Text('1000'),
                              )
                            ],
                          ),
                          Container(
                            child: Text('1000'),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
