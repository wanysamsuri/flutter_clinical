import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customshape.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
        body: Column(
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
            Divider(thickness: 2),
            Container(
              // padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Patient Profile'),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: Icon(Icons.thumb_up),
                        title: Text('Give Feedback'),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: Icon(Icons.document_scanner),
                        title: Text('Terms & Conditions'),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Help'),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        onTap: () async {
                          SharedPreferences storage =
                              await SharedPreferences.getInstance();
                          storage.clear();
                          Get.toNamed('/loading');
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
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
