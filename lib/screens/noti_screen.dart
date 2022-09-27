import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Noti_screen extends StatefulWidget {
  const Noti_screen({Key? key}) : super(key: key);

  @override
  State<Noti_screen> createState() => _Noti_screenState();
}

class _Noti_screenState extends State<Noti_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 205, 219),
        title: const Center(child: const Text('Notification')),
      ),
      body: Center(
        child: Text('Noti'),
      ),
    );
  }
}
