import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/record_screen.dart';
import 'package:flutter_clinic/screens/empty_state.dart';
import 'package:flutter_clinic/screens/empty_state_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '../../customshape.dart';

class PanelRecords extends StatefulWidget {
  const PanelRecords({Key? key}) : super(key: key);

  @override
  State<PanelRecords> createState() => _PanelRecordsState();
}

class _PanelRecordsState extends State<PanelRecords> {
  Future? futureFetchPanelList;
  @override
  void initState() {
    // TODO: implement initState
    futureFetchPanelList = ApiService().fetchPanelList();
    super.initState();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.1,
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 157, 228, 234),
              )),
          centerTitle: true,
          title: const Text('Panels Records'),
        ),
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: futureFetchPanelList,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: 10,
                      padding: EdgeInsets.all(0),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          shadowColor: Colors.grey[300],
                          elevation: 3.0,
                          // margin: EdgeInsets.all(30),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xFFEEEEEE), width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: SkeletonAnimation(
                              shimmerDuration: 500,
                              child: Container(
                                padding: EdgeInsets.all(30),
                                // color: Colors.grey,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 10,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      },
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List panelList = snapshot.data;
                      print('has data');
                      return (panelList.isNotEmpty)
                          ? GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HealthRecord(
                                                  orderId: snapshot.data[index]
                                                          ['id']
                                                      .toString(),
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: Adaptive.h(10),
                                          width: Adaptive.w(20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                          .data[index]['panel']
                                                      ['logo_url']))),
                                        ),
                                        Text(
                                          snapshot.data[index]['panel']['name']
                                              .toString()
                                              .toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : Center(
                              child: EmptyStateScreen(),
                            );
                    } else if (snapshot.hasError) {
                      print('has error');
                      return Center(
                        child: Text('error'),
                      );
                    } else {
                      print('Empty');
                      return Center(
                        child: Text('Empty'),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
