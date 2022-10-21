import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clinic/models/data_model.dart';
import 'package:flutter_clinic/models/refer_letter_model.dart';
import 'package:flutter_clinic/screens/health%20record/prescription2.dart';
import 'package:flutter_clinic/screens/health%20record/refer_letter_screen2.dart';
import 'package:flutter_clinic/screens/signin_page.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReferLetter extends StatefulWidget {
  const ReferLetter({Key? key}) : super(key: key);

  @override
  State<ReferLetter> createState() => _ReferLetterState();
}

class _ReferLetterState extends State<ReferLetter>
    with TickerProviderStateMixin {
  late List<GlobalKey> expansionTile;
  int selected = -1;
  final List<ReferLetter_Model> items = [
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'PoliKlinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
    ReferLetter_Model(
      title: 'Poliklinik Dr Hanafi',
      patient: 'Name',
      date: "Date",
    ),
  ];
  @override
  void initState() {
    super.initState();
    expansionTile = List<GlobalKey<_ReferLetterState>>.generate(
        items.length, (index) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(Adaptive.w(1)),
                height: 100.h,
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
                                                          ReferLetter2()));
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
