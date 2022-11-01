import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clinic/models/EMC_model.dart';
import 'package:flutter_clinic/models/data_model.dart';
import 'package:flutter_clinic/screens/health%20record/prescription2.dart';
import 'package:flutter_clinic/screens/signin_page.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:html2md/html2md.dart' as html2md;

import '../../services/api_service.dart';
import 'EMC2.dart';

class EMC extends StatefulWidget {
  final String orderId;
  const EMC({Key? key, required this.orderId}) : super(key: key);

  @override
  State<EMC> createState() => _EMCState();
}

class _EMCState extends State<EMC> with TickerProviderStateMixin {
  Future? futureFetchPanelRecord;
  int selected = -1;
  @override
  void initState() {
    super.initState();
    futureFetchPanelRecord = ApiService().fetchPanelRecords(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(Adaptive.w(1)),
                height: 100.h,
                child: SingleChildScrollView(
                    child: Column(children: [
                  // SizedBox(height: 25),
                  FutureBuilder(
                      future: futureFetchPanelRecord,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            key: Key('builder ${selected.toString()}'),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data['notes'].length,
                            itemBuilder: (context, index) {
                              var html = snapshot.data['notes'][index]['notes'];
                              var convertedHtml = html2md.convert(html);
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.0, vertical: 10.0),

                                //body listview

                                child: Container(
                                  child: Card(
                                      color: Color(0xFFEEEEEE),
                                      shadowColor: Colors.grey[300],
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFFEEEEEE),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ExpansionTile(
                                          key: Key(index.toString()),
                                          initiallyExpanded: index == selected,
                                          onExpansionChanged: (newState) {
                                            if (newState) {
                                              setState(() {
                                                selected = index;
                                              });
                                            } else {
                                              setState(() {
                                                selected = -1;
                                              });
                                            }
                                          },
                                          title:
                                              // Text('data'),
                                              Center(
                                                  child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15.0),
                                            child: Text(
                                              snapshot.data['name'],
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15.0),
                                            child: Text(
                                              'test',
                                              // DateFormat('EEEE, MMMM d, '
                                              //         'yyyy, '
                                              //         'hh:mm a')
                                              //     .format(DateTime.parse(
                                              //       snapshot
                                              //                     .data[
                                              //                 'prescriptions']
                                              //             [index]['created_at'])
                                              //         .toLocal()),
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),

                                          //below
                                          children: <Widget>[
                                            // AspectRatio(
                                            //   aspectRatio: 100,
                                            //   // child: Text(items[index].patient),
                                            // ),

                                            Center(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Notes :',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(convertedHtml),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      primary: Color.fromARGB(
                                                          255, 3, 205, 219),
                                                    ),
                                                    child: Text(
                                                      'View Details',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      EMC_2(
                                                                        panelName:
                                                                            snapshot.data['panel']['name'],
                                                                        patientName:
                                                                            snapshot.data['name'],
                                                                        nric: snapshot
                                                                            .data['nric'],
                                                                        phoneNum:
                                                                            snapshot.data['phone'],
                                                                        gender:
                                                                            "Male",
                                                                        date:
                                                                            // DateFormat(
                                                                            //         'dd MMMM yyyy')
                                                                            //     .format(
                                                                            //         DateTime.parse(
                                                                            snapshot.data['prescriptions'][index]['created_at'],
                                                                        // .toLocal()),
                                                                        description:
                                                                            convertedHtml,
                                                                      )));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ])),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 5),
                          );
                        } else {
                          return SkeletonAnimation(
                              child: Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                          ));
                        }
                      })
                ])))));
  }
}
