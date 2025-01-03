import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:intl/intl.dart';

import '../../customshape.dart';
import '../../services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController nameController = TextEditingController();
  // Future? futureNotification;
  // int selected = -1;
  // @override
  // void initState() {
  //   super.initState();
  //   futureNotification = ApiService().fetchNotification();
  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: screenHeight * 0.2,
        title: Center(
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 50,
            child: Icon(
              Icons.notifications_active,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.delete,
                  size: 26.0,
                  color: Colors.red,
                ),
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(Adaptive.w(2)),
        // height: 130.h,
        child: SafeArea(
          child: FutureBuilder(
            future: ApiService().fetchNotificationById(widget.id),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(Adaptive.w(2)),
                  // height: 130.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.0, vertical: 10),

                                  //body listview
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    // height: Adaptive.h(40),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            (snapshot.data['data']['message']),
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Adaptive.h(1),
                                        ),
                                        Container(
                                          child: Text(
                                            DateFormat('MMM dd yyyy hh:mm a')
                                                .format(DateTime.parse(snapshot
                                                        .data['created_at'])
                                                    .toLocal()),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Adaptive.h(3),
                                        ),
                                        Container(
                                          child: Text(
                                            (snapshot.data['data']['message']),
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ]),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
