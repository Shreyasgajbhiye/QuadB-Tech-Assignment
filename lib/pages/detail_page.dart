import 'package:flutter/material.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/model/response.dart';
import 'package:quadb/utils/string_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quadb/widget/loading_and_error.dart';

class DetailPage extends StatelessWidget {
  final Show show;

  const DetailPage({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    List<String> images = [];
    if (show.image != null) {
      images.add(show.image!.original);
      images.add(show.image!.medium);
    }

    return Scaffold(
      backgroundColor: AppColor.bg_color,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.title_color),
        backgroundColor: AppColor.bg_color,
        title: Text(
          show.name,
          style: TextStyle(color: AppColor.title_color),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (images.isEmpty)
                  buildLoadingState(mq)
                else
                  CarouselSlider(
                    options: CarouselOptions(
                      height: mq.height * 0.35,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                    ),
                    items: images.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return buildLoadingState(mq);
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: mq.height * 0.35,
                                  color: Colors.grey[800],
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      show.genres.isNotEmpty ? show.genres.join(', ') : 'N/A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mq.width * 0.035,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(mq.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    show.name,
                    style: TextStyle(
                      fontSize: mq.width * 0.045,
                      color: AppColor.title_color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: mq.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Language: ${show.language}',
                        style: TextStyle(
                          color: AppColor.desc_color,
                          fontSize: mq.width * 0.035,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: mq.width * 0.05),
                          SizedBox(width: 4),
                          Text(
                            '${show.rating?.average ?? 'N/A'}',
                            style: TextStyle(
                              color: AppColor.desc_color,
                              fontSize: mq.width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: mq.height * 0.01),
                  Text(
                    StringHelper.parseHtmlString(show.summary),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: AppColor.desc_color,
                      fontSize: mq.width * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}