import 'package:flutter/material.dart';

import '../../customshape.dart';

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
          toolbarHeight: screenHeight * 0.1,
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 3, 205, 219),
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
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/noNoti.png',
                  fit: BoxFit.fill,
                  height: 190,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'No Notifications Yet',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Notifications will show up here when there is one',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      )),
    );
  }
}
