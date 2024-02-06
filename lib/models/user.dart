class User {
  String name;
  String role;
  int id;

  User(this.name, this.role, this.id);

  int readArticle(){
    return 1;
  }

  int createArticle(){
    // Si ADMIN!
    return 1;
  }

  int getFavorites(){
    return 1;
  }
}