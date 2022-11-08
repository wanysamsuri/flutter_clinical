import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:html2md/html2md.dart' as html2md;

import '../../services/api_service.dart';

class ArticleDetailsShow extends StatefulWidget {
  final String articleId;
  const ArticleDetailsShow({super.key, required this.articleId});

  @override
  State<ArticleDetailsShow> createState() => _ArticleDetailsShowState();
}

class _ArticleDetailsShowState extends State<ArticleDetailsShow> {
  @override
  Widget build(BuildContext context) {
    List imageHighlightDetails = [];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          FutureBuilder(
            future: ApiService().fetchArticleShow(widget.articleId),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  imageHighlightDetails = snapshot.data['media'];
                  var htmlFromAPI = snapshot.data != null
                      ? snapshot.data['description']
                      : null;
                  var descriptionConvert = html2md.convert(htmlFromAPI);

                  return Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data['title'],
                              textAlign: TextAlign.justify,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 350,
                                aspectRatio: 2,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal,
                              ),
                              itemCount: snapshot.data['media'].length,
                              itemBuilder: (context, index, pageViewIndex) {
                                return Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 350,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: imageHighlightDetails.isNotEmpty
                                            ? CachedNetworkImage(
                                                imageUrl: snapshot.data['media']
                                                    [index]['original_url'],
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                placeholder:
                                                    (BuildContext context,
                                                            String url) =>
                                                        const Center(
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              )
                                            : Image.asset('assets/medpalw.jpg'),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data['tags'].length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, top: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.2)),
                                      padding: const EdgeInsets.only(
                                          right: 8.0, left: 8.0),
                                      child: Center(
                                        child: Text(
                                          snapshot.data['tags'][index]['name'],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.account_circle_outlined),
                                Expanded(
                                  child: Text(
                                    snapshot.data['user']['name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  DateFormat('MMM dd yyyy hh:mm a').format(
                                      DateTime.parse(
                                              snapshot.data['created_at'])
                                          .toLocal()),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   snapshot.data['name'],
                            //   style: const TextStyle(fontWeight: FontWeight.bold),
                            //   textAlign: TextAlign.justify,
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(descriptionConvert)
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          )
        ],
      )),
    );
  }
}
