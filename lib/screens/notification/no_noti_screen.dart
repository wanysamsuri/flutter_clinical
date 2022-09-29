import 'package:flutter/material.dart';

class NoNoti extends StatefulWidget {
  const NoNoti({Key? key}) : super(key: key);

  @override
  State<NoNoti> createState() => _NoNotiState();
}

class _NoNotiState extends State<NoNoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                  child: Column(
                children: [
                  Image.asset(
                    'assets/noNoti.png',
                    fit: BoxFit.fill,
                    height: 190,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'No notifications yet',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Check this section for updates, news and general notification',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
