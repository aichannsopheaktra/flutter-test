import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/login.dart';

class LoginController {
  Future<void> login(String email, String password) async {
    final loginModel = LoginModel(email: email, password: password);
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginModel.toJson()),
    );

    if (response.statusCode == 200) {
      print('Login successful');
      // Navigate to the next screen or handle successful login
    } else {
      print('Login failed: ${response.statusCode}');
      // Handle login failure
    }
  }
}
