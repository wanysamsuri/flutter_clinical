import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'noti_screen.dart';

class Prescription2 extends StatefulWidget {
  const Prescription2({Key? key}) : super(key: key);

  @override
  State<Prescription2> createState() => _Prescription2State();
}

class _Prescription2State extends State<Prescription2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 205, 219),
        title: const Center(child: const Text('Prescription')),
      ),
      body: Center(
        child: Text('Prescription'),
      ),
    );
  }
}
