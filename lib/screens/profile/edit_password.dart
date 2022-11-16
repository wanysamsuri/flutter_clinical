import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final formkey = GlobalKey<FormState>();
  String NRIC = '';
  String password = '';
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmController = TextEditingController();
  bool isHiddenPassword = true;
  void _togglePasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else  {
    //   isHiddenPassword = true;
    // }
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(Adaptive.cm(1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //nric
            Text(
              'Old Password',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
                obscureText: isHiddenPassword,
                controller: oldPasswordController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      20,
                    ))),
                validator: (value) {
                  if (value != null && value.length < 8) {
                    return 'Enter min. 8 characters';
                  } else {
                    return null;
                  }
                }),

            //password
            SizedBox(height: 30),
            //nric
            Text(
              'New Password',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
                obscureText: isHiddenPassword,
                controller: newPasswordController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      20,
                    ))),
                validator: (value) {
                  if (value != null && value.length < 8) {
                    return 'Enter min. 8 characters';
                  } else {
                    return null;
                  }
                }),
            //password
            SizedBox(height: 30),
            Text(
              'New Confirm Password',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
                obscureText: isHiddenPassword,
                controller: newPasswordConfirmController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      20,
                    ))),
                validator: (value) {
                  if (value != null && value.length < 8) {
                    return 'Enter min. 8 characters';
                  } else {
                    return null;
                  }
                }),
          ],
        ),
      ),
    );
  }
}
