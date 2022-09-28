import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotiScreen extends StatefulWidget {
  const NotiScreen({Key? key}) : super(key: key);

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
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
