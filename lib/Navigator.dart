import 'package:chez_meme/HomePage.dart';
import 'package:flutter/material.dart';
import 'ConnectionPage.dart';

class Navigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ConnectionPage());
      case '/page2':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('Page not found'))));
    }
  }
}
