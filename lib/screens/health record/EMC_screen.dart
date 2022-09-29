import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clinic/models/EMC_model.dart';
import 'package:flutter_clinic/models/data_model.dart';
import 'package:flutter_clinic/screens/health%20record/prescription2.dart';
import 'package:flutter_clinic/screens/signin_page.dart';
import 'package:flutter/widgets.dart';

import 'EMC2.dart';

class EMC extends StatefulWidget {
  const EMC({Key? key}) : super(key: key);

  @override
  State<EMC> createState() => _EMCState();
}

class _EMCState extends State<EMC> with TickerProviderStateMixin {
  late List<GlobalKey> expansionTile;
  int selected = -1;
  final List<EMC_Model> items = [
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'PoliKlinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    EMC_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
  ];
  @override
  void initState() {
    super.initState();
    expansionTile = List<GlobalKey<_EMCState>>.generate(
        items.length, (index) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  ListView.builder(
                      key: Key('builder ${selected.toString()}'),
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 10.0),

                            //body listview

                            child: Card(
                                color: Color(0xFFEEEEEE),
                                shadowColor: Colors.grey[300],
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(0xFFEEEEEE), width: 1),
                                    borderRadius: BorderRadius.circular(20)),
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
                                    title: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15.0),
                                      child: Text(
                                        items[index].title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )),
                                    subtitle: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              items[index].patient,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              items[index].date,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ]),
                                    ),

                                    //below
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 100,
                                        // child: Text(items[index].patient),
                                      ),
                                      Center(
                                        child: Container(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0),
                                              ),
                                              primary: Colors.grey[500],
                                            ),
                                            child: Text(
                                              'Select',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EMC_2()));
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                      )
                                    ])));
                      })
                ])))));
  }
}
