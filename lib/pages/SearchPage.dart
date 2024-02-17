import 'package:flutter/material.dart';
import '../models/article.dart';
import 'ViewArticle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  List<Article> allArticles = [
    Article("PIZZA", "Description 1", "tag1","Contenu 1"),
    Article("THAI", "Description 2", "tag3", "Contenu 2"),
  ];

  List<Article> searchResults = [];
  String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(104, 2, 42, 1.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Effectuer une recherche',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          searchTerm = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Entrez votre terme de recherche',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    searchResults = allArticles
                        .where((article) =>
                    article.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
                        article.description.toLowerCase().contains(searchTerm.toLowerCase()) ||
                        article.tag.toLowerCase().contains(searchTerm.toLowerCase())
                    )
                        .toList();


                    if (searchResults.isEmpty) {
                      searchResults.clear();
                    }

                    setState(() {});
                  },
                  child: const Text('Rechercher'),
              ),
                    if (searchResults.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          const Text(
                            'Résultats de la recherche :',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          // Affichez les résultats de la recherche avec ListView.builder
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Naviguer vers la page de détails de l'article
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewArticle(article: searchResults[index]),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Text(searchResults[index].title),
                                    subtitle: Text(searchResults[index].description),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ] else ...[
                      const SizedBox.shrink(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}