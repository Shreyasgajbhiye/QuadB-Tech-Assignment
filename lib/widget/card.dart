import 'package:flutter/material.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/model/response.dart';
import 'package:quadb/pages/detail_page.dart';
import 'package:get/get.dart';
import 'package:quadb/utils/string_helper.dart';
import 'package:quadb/widget/loading_and_error.dart';

class ShowCard extends StatelessWidget {
  final Show show;

  const ShowCard({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Get.to(() => DetailPage(show: show)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (show.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      show.image!.original,
                      height: mq.height * 0.25,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return buildLoadingState(mq);
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: mq.height * 0.25,
                          color: Colors.grey[800],
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  )
                else
                  Container(
                    height: mq.height * 0.25,
                    width: mq.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
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
                      show.genres.isNotEmpty ? show.genres[0] : 'N/A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mq.width * 0.035,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                          child: Text(
                            show.name,
                            style: TextStyle(
                              color: AppColor.title_color,
                              fontSize: mq.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
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
                  SizedBox(
                    height: mq.height * 0.01,
                  ),
                  Text(
                    StringHelper.parseHtmlString(show.summary),
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: mq.width * 0.036,
                      color: AppColor.desc_color,
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