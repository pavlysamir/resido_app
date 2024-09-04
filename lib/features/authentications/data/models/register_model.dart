class UserRegister {
  String name;
  String email;

  int id;

  UserRegister({
    required this.name,
    required this.email,
    required this.id,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      name: json['name'],
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
    };
  }
}

class DataUserRegister {
  UserRegister user;
  String token;

  DataUserRegister({required this.user, required this.token});

  factory DataUserRegister.fromJson(Map<String, dynamic> json) {
    return DataUserRegister(
      user: UserRegister.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
    };
  }
}
