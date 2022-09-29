import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';

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
          toolbarHeight: 75,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 3, 205, 219),
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
              padding: EdgeInsets.all(20),
              child: Column(),
            )
          ],
        ));
  }
}
