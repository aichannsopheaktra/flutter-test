import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/model/user_dob.dart';
import 'package:testapi/model/user_location.dart';
import '../model/user.dart';
import '../model/user_name.dart';

// Assuming `e` is your parsed JSON object
// final coordinatesJson = e['location']['coordinate'] ?? {};
// final coordinates = LocationCoordinate.fromJson(coordinatesJson);
class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
