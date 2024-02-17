class Article {
  String title;
  String description;
  List <String> tags;
  String content;

  Article(
      this.title,
      this.description,
      this.tags,
      this.content
      );

  int addToFavorites() {
    return 1;
  }

  int deleteArticle() {
    //Si ADMIN
    return 1;
  }

  int updateArticle() {
    //Si ADMIN
    return 1;
  }
}