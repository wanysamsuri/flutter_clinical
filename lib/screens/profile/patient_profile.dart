import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/profile/help.dart';
import 'package:flutter_clinic/screens/profile/profile_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../customshape.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({Key? key}) : super(key: key);

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
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
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView(children: [
          SizedBox(height: 20),
          Text(
            'Edit Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 10),
                      )
                    ],
                    // shape: BoxShape.circle,
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: AssetImage("assets/sakura.jpg"),
                    // )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              hintStyle: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "NRIC No",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              hintStyle: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "Phone",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              hintStyle: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              hintStyle: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          TextField(
              decoration: InputDecoration(
                  labelText: "Nationality",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(fontSize: 20))),
          SizedBox(height: 20),
          TextField(
              decoration: InputDecoration(
                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(fontSize: 20))),
          SizedBox(height: 20),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Confirm Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(fontSize: 20))),
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Row(children: [
                SizedBox(width: 40),
                Center(
                  child: Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(130, 45),
                              primary: Color.fromARGB(255, 255, 30, 30)),
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          })),
                ),
                SizedBox(width: 50),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(130, 45), primary: Colors.green),
                    child: Text(
                      'Save Edit',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(height: 20),
        ]),
      ),
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