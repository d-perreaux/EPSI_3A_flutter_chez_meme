import 'package:chez_meme/models/user.dart';

class AuthService {
  User? _currentUser;

  User? get currentUser => _currentUser;

  bool isAuthenticated() {
    return _currentUser != null;
  }

  void login(String username, String password) {
    _currentUser = User(username, "USER", 1);
  }

  void logout() {
    _currentUser = null;
  }

  bool hasPermissionToCreateArticle() {
    return _currentUser != null && _currentUser!.role == "ADMIN";
  }
}
