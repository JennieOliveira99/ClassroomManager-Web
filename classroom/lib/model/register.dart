class Register {
  final String name;
  final String email;
  final String username;
  final String password;

  Register({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'nome': name,
    'email': email,
    'usuario': username,
    'senha': password,
  };

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      name: json['nome']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      username: json['usuario']?.toString() ?? '',
      password: json['senha']?.toString() ?? '',
    );
  }
  Register copyWith({
    String? name,
    String? email,
    String? username,
    String? password,
  }) {
    return Register(
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'Register(name: $name, email: $email, username: $username, password: ****)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Register &&
        other.name == name &&
        other.email == email &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        username.hashCode ^
        password.hashCode;
  }
}
