import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Auth {


  static Future<String> findUserData(int userId) async {
    final response = await http.get(Uri.parse('https://65bca6a6b51f9b29e931f27e.mockapi.io/api/v1/users/$userId'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "User Not Found";
    }
  }

  static User? authenticate(String email, String password) {

  }


}