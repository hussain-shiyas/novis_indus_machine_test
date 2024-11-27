import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:novis_machine_test/core/local_storage/hive.dart';

class NetworkService {
   String baseUrl="https://flutter-amr.noviindus.in/api";

  // GET Method
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // POST Method
  Future<dynamic> post(String endpoint, {dynamic body}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: _headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  Map<String, String> get _headers => {
    'Content-Type': 'application/x-www-form-urlencoded',
    if (StorageServiceMixin().getData<String?>(MainBoxKeys.token) != null) 'Authorization': 'Bearer ${StorageServiceMixin().getData(MainBoxKeys.token)}',
  };
}
