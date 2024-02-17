import 'package:flutter/material.dart';
import '../models/article.dart';

class ViewArticle extends StatefulWidget {
  final Article article;

  const ViewArticle({super.key, required this.article});

  @override
  State<ViewArticle> createState() => _ViewArticleState();
}

class _ViewArticleState extends State<ViewArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  widget.article.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.article.tag,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.article.content,
                  style: TextStyle(
                    fontSize: 25,
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


