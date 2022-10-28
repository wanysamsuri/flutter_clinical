import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';

import '../../customshape.dart';
import '../../services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController nameController = TextEditingController();
  Future? futureNotification;
  int selected = -1;
  @override
  void initState() {
    super.initState();
    futureNotification = ApiService().fetchNotification();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.14,
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 157, 228, 234),
              )),
          // title: const Text('Notifications'),
          // centerTitle: true,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(Adaptive.w(2)),
          height: 130.h,
          child: SafeArea(
            child: FutureBuilder(
              future: ApiService().fetchNotification(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.all(Adaptive.w(2)),
                    height: 130.h,
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
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 1,
                                            ),
                                            ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, bottom: 5),
                                                    child: Center(
                                                      child: Text(
                                                        (snapshot.data[index]
                                                                ['data']
                                                            ['message']),
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 5.0),
                                                    child: Text(
                                                      (snapshot.data[index]
                                                          ['created_at']),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 15, top: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    child: Text(
                                                      (snapshot.data[index]
                                                          ['data']['message']),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }))
                        ]),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
