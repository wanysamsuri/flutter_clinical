import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clinic/data/data_model.dart';
import 'package:flutter_clinic/screens/prescription2.dart';
import 'package:flutter_clinic/screens/signin_page.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription>
    with TickerProviderStateMixin {
  late List<GlobalKey> expansionTile;
  int selected = -1;
  final List<AdvancedTile> items = [
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'UniKlinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
    AdvancedTile(title: 'Poliklinik Shah Alam', patient: 'Date', symbol: ':'),
  ];

  @override
  void initState() {
    super.initState();
    expansionTile = List<GlobalKey<_PrescriptionState>>.generate(
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
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        items[index].patient,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
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
                                                          Prescription2()));
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



  // SizedBox(height: 25),
  // Container(
  //     child: ListView(
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         scrollDirection: Axis.vertical,
  //         children: [
  //       Container(
  //           height: 300,
  //           decoration: BoxDecoration(
  //               color: Colors.grey[300],
  //               borderRadius: BorderRadius.circular(20)),
  //           padding: EdgeInsets.symmetric(horizontal: 20),
  //           child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(height: 25),
  //                 Container(
  //                   child: Center(
  //                     child: RichText(
  //                       text: TextSpan(
  //                         text: 'Poliklinik Shah Alam',
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.black,
  //                           fontSize: 18,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: 20),
  //                 Center(
  //                   child: Container(
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                           elevation: 0.0,
  //                           minimumSize: Size(130, 45),
  //                           primary: Color.fromARGB(
  //                               255, 3, 205, 219)),
  //                       child: Text(
  //                         'Select',
  //                         style: TextStyle(fontSize: 18),
  //                       ),
  //                       onPressed: () {
  //                         Navigator.pushReplacement(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) =>
  //                                     prescription2()));
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ])),

  //2
  //         SizedBox(height: 20),
  //         Container(
  //             height: 300,
  //             decoration: BoxDecoration(
  //                 color: Colors.grey[300],
  //                 borderRadius: BorderRadius.circular(20)),
  //             padding: EdgeInsets.symmetric(horizontal: 20),
  //             child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(height: 25),
  //                   Container(
  //                     child: Center(
  //                       child: RichText(
  //                         text: TextSpan(
  //                           text: 'Poliklinik Shah Alam',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black,
  //                             fontSize: 18,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ])),

  //         //3
  //         //2
  //         SizedBox(height: 20),
  //         Container(
  //             height: 300,
  //             decoration: BoxDecoration(
  //                 color: Colors.grey[300],
  //                 borderRadius: BorderRadius.circular(20)),
  //             padding: EdgeInsets.symmetric(horizontal: 20),
  //             child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(height: 25),
  //                   Container(
  //                     child: Center(
  //                       child: RichText(
  //                         text: TextSpan(
  //                           text: 'Poliklinik Shah Alam',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black,
  //                             fontSize: 18,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ])),

  //         //4
  //         //2
  //         SizedBox(height: 20),
  //         Container(
  //             height: 300,
  //             decoration: BoxDecoration(
  //                 color: Colors.grey[300],
  //                 borderRadius: BorderRadius.circular(20)),
  //             padding: EdgeInsets.symmetric(horizontal: 20),
  //             child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(height: 25),
  //                   Container(
  //                     child: Center(
  //                       child: RichText(
  //                         text: TextSpan(
  //                           text: 'Poliklinik Shah Alam',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black,
  //                             fontSize: 18,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ])),
  //       ]))
  // ])))));

