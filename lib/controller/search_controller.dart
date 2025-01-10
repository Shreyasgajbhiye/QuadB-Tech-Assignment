import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quadb/model/response.dart';

class ShowSearchController extends GetxController {
  var isLoading = false.obs;
  var searchResults = <ShowResponse>[].obs;
  var searchQuery = ''.obs;

  Future<void> searchShows(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://api.tvmaze.com/search/shows?q=$query'),
      );
      
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        searchResults.value = jsonResponse
            .map((data) => ShowResponse.fromJson(data))
            .toList();
      }
    } catch (e) {
      print('Error searching shows: $e');
    } finally {
      isLoading(false);
    }
  }
}
