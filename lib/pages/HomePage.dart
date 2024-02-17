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

  Article article = Article("cumque exercitationem inventore", "j'adore l'eau", "agua", "Minus accusamus commodi. Illo consequuntur quod nulla ipsum pariatur. Veniam ratione similique quod consequuntur assumenda autem laudantium aliquid consequuntur. Dignissimos saepe velit porro dignissimos cumque voluptatibus quos magnam nulla. Maiores veniam asperiores culpa laboriosam rerum mollitia. Suscipit incidunt atque delectus.\nAliquid repellendus animi commodi quibusdam placeat cupiditate maiores consequatur error. Nam earum autem repudiandae omnis laudantium fuga dolor delectus. Dolor neque nulla. Velit aut deserunt impedit aliquam iusto aut esse hic harum.\nSoluta consequatur ab sapiente praesentium illo et animi vitae neque. Pariatur temporibus sequi. Corrupti beatae voluptate neque numquam. Illum doloremque repellendus voluptate perspiciatis. Debitis enim porro quae praesentium. Error fugit debitis in quis.");

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
