import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/profile/edit_profile.dart';
import 'package:flutter_clinic/screens/profile/help_faq.dart';
import 'package:flutter_clinic/screens/profile/profile_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_clinic/services/api_service.dart';

import '../../customshape.dart';
import '../loading_screen.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  TextEditingController nameController = TextEditingController();
  Future? futureUserProfile;
  int selected = -1;
  @override
  void initState() {
    super.initState();
    futureUserProfile = ApiService().fetchUserProfile();
  }

  // bool isObscurePassword = true;
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
          title: const Text('My Profile'),
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
      body: FutureBuilder(
          future: ApiService().fetchUserProfile(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ListView(children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Stack(children: [
                      Column(
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
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: Adaptive.h(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Name:',
                            style: TextStyle(
                              letterSpacing: 5,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            snapshot.data['name'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: Adaptive.h(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'NRIC:',
                            style: TextStyle(
                              letterSpacing: 5,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            snapshot.data['nric'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: Adaptive.h(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Email:',
                            style: TextStyle(
                              letterSpacing: 5,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            snapshot.data['email'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(130, 45),
                          primary: Color.fromARGB(255, 157, 228, 234),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfileScreens()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ]),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

// Widget buildTextField (String labelText, String placeholder, bool isPasswordTextField){
//   return Padding(padding: EdgeInsets.only(bottom: 30),
//   child: TextField(
//     obscureText: isPasswordTextField ? isObscurePassword = false,
//     decoration: InputDecoration

//   ),
//   );
// }
