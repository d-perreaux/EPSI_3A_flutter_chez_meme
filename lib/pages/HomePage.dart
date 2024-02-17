import 'package:chez_meme/models/article.dart';
import 'package:chez_meme/pages/CreateArticlePage.dart';
import 'package:chez_meme/pages/FavoritesPage.dart';
import 'package:chez_meme/pages/SearchPage.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: [
          Text("Rechercher un article"),
          Text("Favoris"),
          Text("Ecrire un article")
        ][_currentIndex],
      ),
      body: [
        SearchPage(),
        FavoritesPage(),
        CreateArticlePage()
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Créer article',
          ),
        ],
      ),
    );
  }
}
