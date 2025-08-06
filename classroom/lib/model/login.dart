class Login {
  final String username;
  final String password;

  Login({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'usuario': username, 'senha': password};
  }
}
