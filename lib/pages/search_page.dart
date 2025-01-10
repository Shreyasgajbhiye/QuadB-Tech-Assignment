import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadb/constant/colors.dart';
import 'package:quadb/controller/search_controller.dart';
import 'package:quadb/widget/bottom_nav_bar.dart';
import 'package:quadb/widget/card.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ShowSearchController controller = Get.put(ShowSearchController());

  @override
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg_color,
      appBar: AppBar(
        backgroundColor: AppColor.bg_color,
        title: Text(
          'Search Shows',
          style: TextStyle(color: AppColor.title_color),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: 'Search TV Shows...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white, 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: _focusNode.hasFocus
                        ? Colors.red
                        : Colors.grey, 
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.red, 
                    width: 2.0,
                  ),
                ),
              ),
              style: TextStyle(
                color:
                    Colors.black, 
              ),
              onChanged: (value) {
                controller.searchQuery.value = value;
                controller.searchShows(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        final show = controller.searchResults[index].show;
                        return ShowCard(show: show);
                      },
                    ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
