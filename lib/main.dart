import 'package:flutter/material.dart';
import 'package:chez_meme/pages/ConnectionPage.dart';
import 'package:chez_meme/utility/providerUser.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        home: ConnectionPage(),
      ),
    );
  }
}

