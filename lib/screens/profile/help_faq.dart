import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/models/help_faq_model.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

Future? futurefetchFAQ;
int selected = -1;

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    futurefetchFAQ = ApiService().fetchFAQ();
    super.initState();
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
        body: Container(
            child: FutureBuilder(
                future: futurefetchFAQ,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        padding: EdgeInsets.all(Adaptive.w(1)),
                        height: Adaptive.h(100),
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                          ListView.builder(
                              // key: Key('builder ${selected.toString()}'),
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 5),

                                    //body listview

                                    child: Card(
                                      child: ExpansionTile(
                                        leading: Icon(Icons.question_mark),
                                        title: Container(
                                          child: Text(
                                            snapshot.data[index]['question '],
                                          ),
                                        ),
                                        children: [
                                          ListTile(
                                            title: Text(
                                                snapshot.data[index]['answer']),
                                          )
                                        ],
                                      ),
                                    )
                                    // GFAccordion(
                                    //   collapsedTitleBackgroundColor:
                                    //       secondaryColor,
                                    //   expandedTitleBackgroundColor:
                                    //       Colors.grey[300],
                                    //   collapsedIcon: Icon(Icons.add),
                                    //   expandedIcon: Icon(Icons.minimize),
                                    //   title: snapshot.data[index]['question '],

                                    //   // titleBorderColors.amber,
                                    //   content: snapshot.data[index]['answer'],
                                    //   textStyle: TextStyle(fontSize: 0.27.dp),
                                    //   contentBackgroundColor: Colors.grey[100],
                                    // )
                                    );
                              })
                        ])));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
