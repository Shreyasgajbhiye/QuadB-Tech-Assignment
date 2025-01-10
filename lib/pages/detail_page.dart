import 'package:flutter/material.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/model/response.dart';
import 'package:quadb/utils/string_helper.dart';
import 'package:quadb/widget/bottom_nav_bar.dart';

class DetailPage extends StatelessWidget {
  final Show show;

  const DetailPage({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bg_color,
      appBar: AppBar(
        backgroundColor: AppColor.bg_color,
        title: Text(show.name, style: TextStyle(color: AppColor.title_color),),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (show.image != null)
              Center(
                child: Image.network(
                  show.image!.original,
                  height: mq.height * 0.35,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: mq.height * 0.35,
                      color: const Color.fromARGB(255, 69, 68, 68),
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            Container(

              padding: EdgeInsets.all(mq.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: mq.height * 0.02),
                  Text(
                    show.name,
                    style: TextStyle(
                      fontSize: mq.width * 0.08,
                      color: AppColor.title_color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    StringHelper.parseHtmlString(show.summary),
                    style: TextStyle(
                      color: AppColor.desc_color,
                      fontSize: mq.width * 0.045,
                      // height: 1.5,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
