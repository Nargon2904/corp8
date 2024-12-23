class User {
  int id;
  String username;
  String email;
  String password;

  User(this.id, this.username, this.email, this.password);
}

User currentUser = User(
  0,
  '',
  '',
  '',
);