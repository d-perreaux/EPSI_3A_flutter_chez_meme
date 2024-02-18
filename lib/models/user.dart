import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String name;
  String password;
  bool role;
  String id;

  User(this.name, this.password, this.role, this.id);

  void updateUser({String? name, String? password, bool? role, String? id}) {
    this.name = name ?? this.name;
    this.password = password ?? this.password;
    this.role = role ?? this.role;
    this.id = id ?? this.id;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
    'role': role,
    'id': id,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'] as String,
      json['password'] as String,
      json['isAdmin'] as bool,
      json['id'] as String
    );
  }
}
