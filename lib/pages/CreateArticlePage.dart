import 'package:flutter/material.dart';


class CreateArticlePage extends StatefulWidget {
  const CreateArticlePage({super.key});

  @override
  State<CreateArticlePage> createState() => _CreateArticlePageState();
}

class _CreateArticlePageState extends State<CreateArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('Titre', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Titre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Remèdes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Remèdes',
                hintText: 'Ingrédients et commentaire pour chaques remèdes',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
            const SizedBox(height: 16.0),
            const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text('Enregistrer'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Conditions Générales d\'Utilisation'),
            ),
          ],
        ),
      ),
    );
  }
}
