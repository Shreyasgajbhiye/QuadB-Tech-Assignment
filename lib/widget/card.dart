import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/model/response.dart';
import 'package:quadb/pages/detail_page.dart';
import 'package:quadb/utils/string_helper.dart';

class ShowCard extends StatelessWidget {
  final Show show;

  const ShowCard({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: mq.height * 0.2,
      width: mq.width,
      decoration: BoxDecoration(
          color: AppColor.card_color, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => Get.to(() => DetailPage(show: show)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (show.image != null)
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  show.image!.medium,
                  width: mq.width * 0.3,
                  height: mq.height * 0.2,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: mq.width * 0.3,
                      height: mq.height * 0.19,
                      color: const Color.fromARGB(255, 67, 66, 66),
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            SizedBox(
              width: mq.width * 0.03,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.03),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      show.name,
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColor.title_color,
                        fontSize: mq.width * 0.047,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: mq.height * 0.01),
                    Text(
                      StringHelper.parseHtmlString(show.summary),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: mq.width * 0.036,
                          color: AppColor.desc_color),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
