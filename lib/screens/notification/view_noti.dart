import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';

import '../../customshape.dart';
import '../../services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewNotification extends StatefulWidget {
  const ViewNotification({Key? key}) : super(key: key);

  @override
  State<ViewNotification> createState() => _ViewNotificationState();
}

class _ViewNotificationState extends State<ViewNotification> {
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
                          Container(
                            padding: EdgeInsets.all(20),
                            child: const Text(
                              "Here's what you missed",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.0, vertical: 10),

                                      //body listview
                                      child: Container(
                                        height: 80,
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
                                              // leading: Column(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.center,

                                              // children: [
                                              //   Icon(Icons.phone_android),
                                              // ],
                                              // ),
                                              title: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Center(
                                                      child: Text(
                                                        (snapshot.data[index]
                                                                ['data']
                                                            ['message']),
                                                        maxLines: 1,
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
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15.0),
                                                child: Text(
                                                  (snapshot.data[index]['data']
                                                      ['message']),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),

                                              trailing: IconButton(
                                                icon: Icon(
                                                    Icons.navigate_next_sharp),
                                                onPressed: () {},
                                              ),
                                              
                                            ),
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
