class Article {
  String title;
  String description;
  String tag;
  String content;

  Article(
      this.title,
      this.description,
      this.tag,
      this.content,
      );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['title'] as String,
      json['description'] as String,
      json['tag'] as String,
      json['content'] as String,
    );
  }
}
