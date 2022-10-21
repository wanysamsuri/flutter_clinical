import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../customshape.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewNotification extends StatefulWidget {
  const ViewNotification({Key? key}) : super(key: key);

  @override
  State<ViewNotification> createState() => _ViewNotificationState();
}

class _ViewNotificationState extends State<ViewNotification> {
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
            title: const Text('Notifications'),
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
            padding: EdgeInsets.all(Adaptive.w(5)),
            child: Column(children: [
              SizedBox(
                height: screenWidth * 0.03,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/noNoti');
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Notification\ntesting',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/noNoti');
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Notification\ntesting',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/noNoti');
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Notification\ntesting',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/noNoti');
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Notification\ntesting',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/noNoti');
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Notification\ntesting',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
            ])));
  }
}
