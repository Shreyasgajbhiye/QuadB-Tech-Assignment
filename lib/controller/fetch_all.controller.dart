import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quadb/model/response.dart';


class HomeController extends GetxController {
  var isLoading = false.obs;
  var showsList = <ShowResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchShows();
  }

  Future<void> fetchShows() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        showsList.value = jsonResponse.map((data) => ShowResponse.fromJson(data)).toList();
      }
    } catch (e) {
      print('Error fetching shows: $e');
    } finally {
      isLoading(false);
    }
  }
}