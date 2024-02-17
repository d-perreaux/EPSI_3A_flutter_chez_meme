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
