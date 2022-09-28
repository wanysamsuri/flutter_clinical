import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clinic/data/data_model.dart';
import 'package:flutter_clinic/screens/health%20record/prescription2.dart';
import 'package:flutter_clinic/screens/signin_page.dart';
import 'package:flutter/widgets.dart';

class EMC extends StatefulWidget {
  const EMC({Key? key}) : super(key: key);

  @override
  State<EMC> createState() => _EMCState();
}

class _EMCState extends State<EMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 25),
                ])))));
  }
}
