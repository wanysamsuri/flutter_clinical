import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/record_screen.dart';
import 'package:flutter_clinic/services/api_service.dart';

import '../customshape.dart';

class PanelRecords extends StatefulWidget {
  const PanelRecords({Key? key}) : super(key: key);

  @override
  State<PanelRecords> createState() => _PanelRecordsState();
}

class _PanelRecordsState extends State<PanelRecords> {
  Future? futureFetchRecords;
  @override
  void initState() {
    // TODO: implement initState
    futureFetchRecords = ApiService().fetchPanelRecords();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 75,
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
        body: FutureBuilder(
            future: futureFetchRecords,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthRecord(orderId: snapshot.data[index]['id'],)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                child: FlutterLogo(size: 40),
                              ),
                              Text(
                                snapshot.data[index]['panel']['name']
                                    .toString()
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
