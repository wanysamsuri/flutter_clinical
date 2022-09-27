import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/models/service.dart';

import 'noti_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: screenHeight * 0.3,
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('30'),
                          const Spacer(),
                          const Icon(Icons.notifications),
                        ],
                      ),
                      const Text(
                        "Hi Guest!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 150,
                                mainAxisExtent: 100,
                                // childAspectRatio: 5 / 4,
                                // crossAxisSpacing: 20,
                                mainAxisSpacing: 0),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: screenHeight * 0.09,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor,
                                  ),
                                  child: Icon(
                                    services[index].icon,
                                    size: 30,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(services[index].serviceName.toString())
                            ],
                          );
                        }),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    const Text(
                      "Latest Articles",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    SizedBox(
                      height: screenHeight * 0.5,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, highlightIndex) {
                          return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             HighlightDetailScreen(
                              //               id: snapshot.data[
                              //                       highlightIndex]
                              //                       ['id']
                              //                   .toString(),
                              //             )));
                            },
                            child: Container(
                                width: 250,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 0.1,
                                              blurRadius: 2,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.white,
                                          // borderRadius: const BorderRadius
                                          //         .only(
                                          //     bottomLeft: Radius
                                          //         .circular(
                                          //             10),
                                          //     bottomRight: Radius
                                          //         .circular(
                                          //             10))
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              width: 300,
                                              height: 200,
                                              child: const FlutterLogo()
                                              //     CachedNetworkImage(
                                              //   imageUrl: snapshot
                                              //               .data[highlightIndex]
                                              //           [
                                              //           'media'][0]
                                              //       [
                                              //       'original_url'],
                                              //   imageBuilder:
                                              //       (context,
                                              //               imageProvider) =>
                                              //           Container(
                                              //     decoration:
                                              //         BoxDecoration(
                                              //             image:
                                              //                 DecorationImage(
                                              //               image:
                                              //                   imageProvider,
                                              //               fit:
                                              //                   BoxFit.cover,
                                              //             ),
                                              //             borderRadius:
                                              //                 BorderRadius.circular(5)),
                                              //   ),
                                              //   placeholder: (BuildContext
                                              //               context,
                                              //           String
                                              //               url) =>
                                              //       const Center(
                                              //     child:
                                              //         SizedBox(
                                              //       width: 30,
                                              //       height: 30,
                                              //       child:
                                              //           CircularProgressIndicator(),
                                              //     ),
                                              //   ),
                                              //   errorWidget: (context,
                                              //           url,
                                              //           error) =>
                                              //       const Icon(Icons
                                              //           .error),
                                              // ),

                                              ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text('Title'),
                                                // Text(
                                                //     snapshot.data[
                                                //             highlightIndex]
                                                //         [
                                                //         'title'],
                                                //     maxLines:
                                                //         2,
                                                //     style:
                                                //         const TextStyle(
                                                //       fontWeight:
                                                //           FontWeight.w500,
                                                //     )),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text('Subtitle'),
                                                // Text(
                                                //     snapshot.data[
                                                //             highlightIndex]
                                                //         [
                                                //         'subtitle'],
                                                //     overflow:
                                                //         TextOverflow
                                                //             .ellipsis,
                                                //     style: const TextStyle(
                                                //         color: Colors
                                                //             .grey,
                                                //         fontSize:
                                                //             12)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 40,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: 5,
                                                      // itemCount: snapshot.data[highlightIndex]['tags'].length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10,
                                                                  top: 10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.2)),
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0,
                                                                  left: 8.0),
                                                          child: const Center(
                                                            child: Text('tags'),
                                                            // Text(
                                                            //   snapshot.data[highlightIndex]['tags'][index]['name'],
                                                            // ),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
