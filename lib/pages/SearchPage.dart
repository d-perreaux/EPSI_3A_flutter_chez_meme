import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import 'ViewArticle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  List<Article> searchResults = [];
  String searchTerm = "";

  Future<List<Article>> fetchArticlesFromApi() async {
    final response = await http.get(Uri.parse('https://65bca6a6b51f9b29e931f27e.mockapi.io/api/v1/articles'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                        onPressed: () async {
                          try {
                            final apiArticles = await fetchArticlesFromApi();
                            searchResults = apiArticles
                                .where((article) =>
                            article.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
                                article.description.toLowerCase().contains(searchTerm.toLowerCase()) ||
                                article.tag.toLowerCase().contains(searchTerm.toLowerCase()))
                                .toList();

                            if (searchResults.isEmpty) {
                              searchResults.clear();
                            }
                            setState(() {});
                          } catch (e) {
                            print('Error fetching articles: $e');
                          }
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
      ),
    );
  }
}
