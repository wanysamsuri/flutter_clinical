import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../customshape.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    ApiService().fetchPanelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.1,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 157, 228, 234),
            )),
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(Adaptive.w(3)),
        height: 110.h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Align(
                  child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: Icon(
                  Icons.person_outline,
                  size: 50,
                  color: Colors.white,
                ),
              )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                '$sharedFullName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(thickness: 2),
              SizedBox(
                height: 30,
              ),
              Container(
                  // padding: EdgeInsets.all(20),
                  child: Column(children: [
                ListView(shrinkWrap: true, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: ListTile(
                        onTap: () async {
                          // SharedPreferences storage =
                          //     await SharedPreferences.getInstance();
                          // storage.clear();
                          Get.toNamed('/profile');
                        },
                        leading: Icon(Icons.person),
                        title: Text('Patient Profile'),
                      ),
                    ),
                  ),
                  // Divider(
                  //   thickness: 2,
                ]),

                //device
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: ListTile(
                        onTap: () async {
                          // SharedPreferences storage =
                          //     await SharedPreferences.getInstance();
                          // storage.clear();
                          Get.toNamed('/device');
                        },
                        leading: Icon(Icons.phone_android),
                        title: Text('Connected Device'),
                      ),
                    )),

                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: ListTile(
                        onTap: () async {
                          // SharedPreferences storage =
                          //     await SharedPreferences.getInstance();
                          // storage.clear();
                          Get.toNamed('/feedback');
                        },
                        leading: Icon(Icons.thumb_up),
                        title: Text('Give Feedback'),
                      ),
                    ))
              ])),
              // Divider(
              //   thickness: 2,
              // ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: ListTile(
                      onTap: () async {
                        // SharedPreferences storage =
                        //     await SharedPreferences.getInstance();
                        // storage.clear();
                        Get.toNamed('/terms');
                      },
                      leading: Icon(Icons.document_scanner),
                      title: Text('Terms & Conditions'),
                    ),
                  )),

              // Divider(
              //   thickness: 2,
              // ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: ListTile(
                        onTap: () async {
                          // SharedPreferences storage =
                          //     await SharedPreferences.getInstance();
                          // storage.clear();
                          Get.toNamed('/help');
                        },
                        leading: Icon(Icons.help),
                        title: Text('Help'),
                      ))),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: ListTile(
                      onTap: () async {
                        // SharedPreferences storage =
                        //     await SharedPreferences.getInstance();
                        // storage.clear();
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Are you sure want to logout?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: TextButton(
                                          onPressed: () {
                                            ApiService().userLogout();
                                          },
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          )),
                                    )
                                  ],
                                ));

                        // Get.toNamed('/loading');
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    // Divider(
                    //   thickness: 2,
                    // ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
