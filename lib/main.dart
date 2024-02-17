
import 'dart:convert';

import 'package:chez_meme/utility/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chez_meme/pages/ConnectionPage.dart';
import 'package:chez_meme/pages/HomePage.dart';
import 'package:chez_meme/models/user.dart';

void main() async{
  var user = await Auth.findUserData(1);
  print(user);

  final userMap = jsonDecode(user) as Map<String, dynamic>;
  final myuser = User.fromJson(userMap);
  print(myuser);


  runApp(Authenticator());
}



class Authenticator extends StatefulWidget {
  @override
  _AuthenticatorState createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  User? _currentUser = null; // Initialiser à null



  Future<void> authenticate(String username, String password) async {
    // logique d'authentification
    // Après avoir authentifié l'utilisateur, mettre à jour _currentUser
    // ex : _currentUser = User(username, isAdmin);

    setState(() {
      _currentUser = User("bobby", false, 1); // Utilisateur anonyme pour test
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ConnectionPage(),
        '/home': (context) => HomePage(),
      },
      // Placer l'instance de l'utilisateur dans le contexte global
      // afin qu'elle puisse être accessible depuis n'importe où dans l'application
      builder: (context, child) {
        return _currentUser != null? Provider.value(
          value: _currentUser,
          child: child,
        )
            : child!;
      },
    );
  }
}