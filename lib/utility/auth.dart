import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Auth {

  static Future<List<User>> findUserData() async {
    final response = await http.get(Uri.parse('https://65bca6a6b51f9b29e931f27e.mockapi.io/api/v1/users'));
    if (response.statusCode == 200) {
      final List<dynamic> userDataList = jsonDecode(response.body) as List<dynamic>;
      return userDataList.map((userData) => User.fromJson(userData)).toList();
    } else {
      throw Exception('Failed to load user data');
    }
  }

  static Future<User?> authenticate(String email, String password) async {
    var userList = await Auth.findUserData();
    for (var user in userList) {
      if (user.name == email && user.password == password) {
        return user;
      }
    }
    return null;
  }
}
