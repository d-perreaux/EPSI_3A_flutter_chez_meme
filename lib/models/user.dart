class User {
  final String name;
  final bool role;
  final int id;

  User(this.name, this.role, this.id);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        role = json['role'] as bool,
        id = json['id'] as int;

  Map<String, dynamic> toJson() => {
    'name': name,
    'role': role,
    'id': id,
  };

  int readArticle() {
    return 1;
  }

  int createArticle() {
    // Si ADMIN!
    return 1;
  }

  int getFavorites() {
    return 1;
  }
}
