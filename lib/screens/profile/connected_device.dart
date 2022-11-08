import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';

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
  // Future? futureConnection = Connectivity().onConnectivityChanged;
  int selected = -1;
  @override
  void initState() {
    super.initState();
    futureDeviceName = ApiService().fetchDeviceName();
  }

  @override
  void dispose() {
    super.dispose();
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
                                "Where you are logged in",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0, vertical: 10),

                                        //body listview

                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 1,
                                              ),
                                              ListTile(
                                                leading: Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Icon(
                                                    Icons.phone_android,
                                                    color: snapshot.data[index]
                                                                ['name'] ==
                                                            sharedDeviceName
                                                        ? Colors.green
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                title:
                                                    // Text('data'),
                                                    Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: Text(
                                                    snapshot.data[index]
                                                        ['name'],
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                subtitle: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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

                                                trailing: IconButton(
                                                  icon: Icon(Icons.delete,
                                                      color: Colors.red),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            ((context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(20))),
                                                                  title: Center(
                                                                    child: Text(
                                                                        'Are you sure want to delete?'),
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'No',
                                                                          style:
                                                                              TextStyle(color: Colors.red),
                                                                        )),
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          ApiService()
                                                                              .deleteDevice(
                                                                            snapshot.data[index]['id'],
                                                                          );
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Yes',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                        ))
                                                                  ],
                                                                )));

                                                    // ApiService().deleteDevice();
                                                    // if (response) {
                                                    //   print(
                                                    //       'Delete data success');
                                                    // } else {
                                                    //   print(
                                                    //       'Delete data failed');
                                                    // }
                                                  },
                                                ),
                                                // InkWell(
                                                //   onTap: () {

                                                //   },
                                                //   child: Padding(
                                                //     padding:
                                                //         const EdgeInsets.only(
                                                //             top: 10,
                                                //             bottom: 10),
                                                //     child: Icon(
                                                //       Icons.delete,
                                                //       color: Colors.red,
                                                //     ),
                                                //   ),
                                                // )
                                              ),
                                            ],
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
