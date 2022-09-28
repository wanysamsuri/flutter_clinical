import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 25),
                  Container(
                      child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: [
                        //1
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Poliklinik Shah Alam',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Remarks:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)))),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                'The patient complains of abdominal pain',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            )))),
                                SizedBox(height: 40),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Date:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ))),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: '23 Sept 2022',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ))),
                                ),
                              ]),
                        ),

                        //2
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Poliklinik Shah Alam',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Remarks:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)))),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                'The patient complains of abdominal pain',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            )))),
                                SizedBox(height: 40),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Date:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ))),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: '23 Sept 2022',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ))),
                                ),
                              ]),
                        ),

                        //3
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Poliklinik Shah Alam',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Remarks:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)))),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                'The patient complains of abdominal pain',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            )))),
                                SizedBox(height: 40),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Date:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ))),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: '23 Sept 2022',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ))),
                                ),
                              ]),
                        ),

                        //3
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Poliklinik Shah Alam',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Remarks:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)))),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                'The patient complains of abdominal pain',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            )))),
                                SizedBox(height: 40),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Date:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ))),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: '23 Sept 2022',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ))),
                                ),
                              ]),
                        ),

                        //5
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Poliklinik Shah Alam',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Remarks:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)))),
                                SizedBox(height: 5),
                                Container(
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                'The patient complains of abdominal pain',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            )))),
                                SizedBox(height: 40),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Date:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ))),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: '23 Sept 2022',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ))),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ]))
                ])))));
  }
}
