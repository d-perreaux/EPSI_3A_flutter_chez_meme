import 'package:flutter/material.dart';

import '../models/article.dart';

class CreateArticlePage extends StatefulWidget {
  const CreateArticlePage({super.key});

  @override
  State<CreateArticlePage> createState() => _TestPageState();
}

class _TestPageState extends State<CreateArticlePage> {

  Article? article;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final remedesController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedTag = 'Metal';

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    remedesController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          margin: EdgeInsetsDirectional.only(start: 20, top: 5, end: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Titre',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Titre',
                        hintText: 'Titre de la page',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tu dois compléter ce champ";
                      }
                    },
                    controller: titleController,
                  ),
                  SizedBox(height: 16.0),
                  Text('Remèdes',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Remèdes',
                      hintText: 'Ingrédients et commentaire pour chaques remèdes',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tu dois compléter ce champ";
                      }
                    },
                    maxLines: 9,
                    controller: remedesController,
                  ),
                  SizedBox(height: 16.0),
                  Text('Description',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tu dois compléter ce champ";
                      }
                    },
                    controller: descriptionController,
                    maxLines: 5,
                  ),
                  SizedBox(height: 16),
                  Text('Tags',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(value: 'Metal', child: Text("Metal"),),
                        DropdownMenuItem(value: 'Non Music', child: Text("Non Music"),),
                        DropdownMenuItem(value: 'Latin', child: Text("Latin"),),
                        DropdownMenuItem(value: 'Jazz', child: Text("Jazz"),),
                        DropdownMenuItem(value: 'Rap', child: Text("Rap"),),
                        DropdownMenuItem(value: 'Country', child: Text("Country"),),
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder()
                      ),
                      value: selectedTag,
                      onChanged: (value){
                        setState(() {
                          selectedTag = value!;
                        });
                      }
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final title = titleController.text;
                        final description = descriptionController.text;
                        final tag = selectedTag;
                        final content = remedesController.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("envoi en cours")));
                        FocusScope.of(context).requestFocus(FocusNode());
                        Article article1 = Article(title,description,tag,content);
                        print("Titre de l'article : ${article1.title}");
                        print("Remèdes de l'article : ${article1.content}");
                        print("Description de l'article : ${article1.description}");
                        print("tag de l'article : ${article1.tag}");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                    ),
                    child: const Text('Enregistrer'),
                  ),
                ],
              )),
        ));
  }
}
