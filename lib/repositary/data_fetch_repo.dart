import 'dart:convert';

import 'package:http/http.dart' as http;

class DataFetchRepo {
  final String _baseurl = "https://dummyjson.com/";

  Future<Map<String, dynamic>> fetchData(String endUrl) async {
    final url = Uri.parse(_baseurl + endUrl);
    try {
      final response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }

}