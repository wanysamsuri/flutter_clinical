import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'noti_screen.dart';

class prescription2 extends StatefulWidget {
  const prescription2({Key? key}) : super(key: key);

  @override
  State<prescription2> createState() => _prescription2State();
}

class _prescription2State extends State<prescription2> {
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
