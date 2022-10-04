import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QueueNew extends StatefulWidget {
  const QueueNew({Key? key}) : super(key: key);

  @override
  State<QueueNew> createState() => _QueueNewState();
}

class _QueueNewState extends State<QueueNew> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.navigate_before,
                              size: 30,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            const Text(
                              'Back',
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Center(
                        child: Container(
                          height: 600,
                          width: 380,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[300],
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Center(
                                child: Text(
                              'Clinic Name:',
                            )),
                          ),
                        ),
                      )
                    ]))));
  }
}
