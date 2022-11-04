import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/models/help_faq_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> with TickerProviderStateMixin {
  late List<GlobalKey> expansionTile;
  int selected = -1;
  final List<helpFAQ_Model> items = [
    helpFAQ_Model(
      title: 'This is message:',
      subtitle: 'This is message:',
    ),
    helpFAQ_Model(
      title: 'This is message',
      subtitle: 'This is message:',
    ),
    helpFAQ_Model(
      title: 'This is message',
      subtitle:
          'This is message:This is message:This is message:This is message:This is message:This is message:This is message:This is message:This is message:This is message:This is message:',
    ),
  ];
  @override
  void initState() {
    super.initState();
    expansionTile = List<GlobalKey<_HelpScreenState>>.generate(
        items.length, (index) => GlobalKey());
  }

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
                // clipper: CustomShape(),
                child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 157, 228, 234),
            )),
            title: const Text(
              'FAQ',
              style: TextStyle(color: Colors.black),
            ),
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
                                horizontal: 1.0, vertical: 1.0),

                            //body listview

                            child: Card(
                                color: secondaryColor,
                                shadowColor: primaryColor,
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
                                    // subtitle: Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(bottom: 10),
                                    //   child: Column(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //       children: <Widget>[
                                    //         Text(
                                    //           items[index].subtitle,
                                    //           style: TextStyle(
                                    //             fontSize: 16,
                                    //             color: Colors.black,
                                    //             fontWeight: FontWeight.bold,
                                    //           ),
                                    //         ),
                                    //         SizedBox(
                                    //           height: 5,
                                    //         ),
                                    //       ]),
                                    // ),

                                    //below
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 100,
                                        // child: Text(items[index].patient),
                                      ),
                                      Container(
                                        child: Text(
                                          items[index].subtitle,
                                          style: TextStyle(fontSize: 18),
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
