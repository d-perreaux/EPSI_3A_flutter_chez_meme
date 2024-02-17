import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 20, top: 20, end: 20),
        child: Form(
          child: Column(
            children: [
              Text('Titre', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titre',
                  hintText: 'Titre de la page',
                  border: OutlineInputBorder()
                ),
              )
            ],
          )
            ),
      )
    );
  }
}
