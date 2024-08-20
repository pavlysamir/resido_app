class UserRegister {
  String name;
  String email;
  String updatedAt;
  String createdAt;
  int id;

  UserRegister({
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      name: json['name'],
      email: json['email'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'updated_at': updatedAt,
      'created_at': createdAt,
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
