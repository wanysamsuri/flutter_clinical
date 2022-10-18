import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../customshape.dart';
import '../../services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConnectedDevicesScreens extends StatefulWidget {
  const ConnectedDevicesScreens({Key? key}) : super(key: key);

  @override
  State<ConnectedDevicesScreens> createState() =>
      _ConnectedDevicesScreensState();
}

class _ConnectedDevicesScreensState extends State<ConnectedDevicesScreens> {
  TextEditingController nameController = TextEditingController();
  Future? futureDeviceName;
  int selected = -1;
  @override
  void initState() {
    super.initState();
    futureDeviceName = ApiService().fetchDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: screenHeight * 0.1,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 157, 228, 234),
                )),
            title: const Text('Connected Devices'),
            centerTitle: true,
            leading: GestureDetector(
              child: const Icon(
                Icons.navigate_before,
                size: 30,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
          padding: EdgeInsets.all(Adaptive.w(2)),
          height: 130.h,
          child: SafeArea(
            child: FutureBuilder(
              future: ApiService().fetchDeviceName(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      padding: EdgeInsets.all(Adaptive.w(2)),
                      height: 130.h,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: const Text(
                                "Where your are logged in",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: 15,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0, vertical: 1.0),

                                        //body listview

                                        child: Container(
                                          decoration: BoxDecoration(
                                              // color: Color(0xFFEEEEEE),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: ListTile(
                                            leading: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.phone_android),
                                              ],
                                            ),
                                            title:
                                                // Text('data'),
                                                Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Text(
                                                snapshot.data[index]['name'],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15.0),
                                              child: Text(
                                                (snapshot.data[index]
                                                    ['created_at']),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }))
                          ]));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
