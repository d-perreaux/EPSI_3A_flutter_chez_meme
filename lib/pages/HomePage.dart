import 'package:chez_meme/pages/AccountPage.dart';
import 'package:chez_meme/pages/CreateArticlePage.dart';
import 'package:chez_meme/pages/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:chez_meme/utility/providerUser.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAdmin = Provider.of<UserProvider>(context).user?.role ?? false;

    return Scaffold(
      appBar: AppBar(
        title: [
          Text("Bienvenue ${Provider.of<UserProvider>(context).user?.name ?? "Accueil"}"),
          if(isAdmin)Text("Ecrire un article"),
          Text("Détails du compte")
        ][_currentIndex],
      ),
      body: [
        SearchPage(),
        if(isAdmin) CreateArticlePage(),
        AccountPage()
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher',
          ),
          if (isAdmin)
            BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Créer article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Compte',
          ),
        ],
      ),
    );
  }
}
