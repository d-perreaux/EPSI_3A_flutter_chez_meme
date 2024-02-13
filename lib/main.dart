import 'package:chez_meme/pages/ConnectionPage.dart';
import 'package:chez_meme/pages/HomePage.dart';
import 'package:chez_meme/pages/ViewArticle.dart';
import 'package:flutter/material.dart';
import 'package:chez_meme/utility/auth_service.dart';
import 'package:chez_meme/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnectionPage(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return _authService.isAuthenticated()
        ? MainScreen(authService: _authService)
        : AuthenticationScreen(authService: _authService);
  }
}

class MainScreen extends StatefulWidget {
  final AuthService authService;

  const MainScreen({Key? key, required this.authService}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titre"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Page1(),
          Page2(),
          if (widget.authService.hasPermissionToCreateArticle()) Page3(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          if (widget.authService.hasPermissionToCreateArticle())
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Réglages',
            ),
        ],
      ),
    );
  }
}

class AuthenticationScreen extends StatelessWidget {
  final AuthService authService;

  const AuthenticationScreen({Key? key, required this.authService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulez l'authentification réussie
            authService.login("utilisateur", "motdepasse");
          },
          child: Text('Se connecter'),
        ),
      ),
    );
  }
}
