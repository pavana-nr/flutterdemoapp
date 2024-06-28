import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService with ChangeNotifier {
  final String baseUrl = 'https://apiv2stg.promilo.com/user/oauth/token';

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: json.encode({'username': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (kDebugMode) {
      print(response.body);
    }
  }
}
