import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyStateScreen extends StatefulWidget {
  const EmptyStateScreen({Key? key}) : super(key: key);

  @override
  State<EmptyStateScreen> createState() => _EmptyStateScreenState();
}

class _EmptyStateScreenState extends State<EmptyStateScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.07,
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          flexibleSpace: ClipPath(
              //clipper: CustomShape(),
              child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 157, 228, 234),
          )),
          title: const Text(''),
          centerTitle: true,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(Adaptive.w(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/empty_state.png',
                  color: Colors.white.withOpacity(0.5),
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.fill,
                  height: 190,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'No Notifications Yet',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Notifications will show up here when there is one',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      )),
    );
  }
}
