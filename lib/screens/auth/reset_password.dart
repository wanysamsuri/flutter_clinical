import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../services/api_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobalKey<FormState> resetPassword = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  // final emailValidator = EmailValidator();
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email address is required'),
    // PatternValidator(pattern, errorText: errorText)
    // MinLengthValidator(11,
    //     errorText: 'IC Number must be at least 11 digits long')
  ]);

  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  resetNewPassword() async {
    final isValidForm = resetPassword.currentState!.validate();
    if (isValidForm) {
      final resetPassword =
          await ApiService().postResetPassword(emailController.text);
      if (resetPassword != null) {
        print('if');
        emailController.clear();
        Timer(Duration(seconds: 2), () {
          Get.back();
        });
      } else {
        print('else');
        _buttonController.error();

        Timer(Duration(seconds: 2), () {
          _buttonController.reset();
          
        });
      }
    }
    _buttonController.reset();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reset password'),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Form(
        key: resetPassword,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/reset_password.jpg', width: 180),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Enter your registered email address below.\nWe will send to your email shortly.',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: emailValidator,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey[50],
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedLoadingButton(
                errorColor: Colors.red,
                successColor: Colors.green,
                valueColor: Colors.white,
                borderRadius: 10,
                color: primaryColor,
                child: const Text('Reset password',
                    style: TextStyle(color: Colors.white)),
                controller: _buttonController,
                onPressed: resetNewPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
