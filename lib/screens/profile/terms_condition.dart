import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/profile/help_faq.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../services/api_service.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

Future? futurefetchFeedback;
int selected = -1;

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  void initState() {
    futurefetchFeedback = ApiService().fetchFAQ();
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
            'Terms & Conditions',
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
          ),
        ),
        body: FutureBuilder(
            future: futurefetchFeedback,
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
                                child: Container(
                                  height: Adaptive.h(5),
                                  color: Colors.amber,
                                  child: Container(
                                    color: Colors.grey[400],
                                    child:
                                        Text(snapshot.data[index]['question ']),
                                  ),
                                ));
                          })
                    ])));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
