class UserLogin {
  int id;
  String name;
  String email;
  String? emailVerifiedAt;
  String? code;
  String role;
  String? image;
  String? phone;
  String? address;
  String createdAt;
  String updatedAt;

  UserLogin({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.code,
    required this.role,
    this.image,
    this.phone,
    this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      code: json['code'],
      role: json['role'],
      image: json['image'],
      phone: json['phone'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'code': code,
      'role': role,
      'image': image,
      'phone': phone,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class DataUserLogin {
  UserLogin user;
  String token;

  DataUserLogin({required this.user, required this.token});

  factory DataUserLogin.fromJson(Map<String, dynamic> json) {
    return DataUserLogin(
      user: UserLogin.fromJson(json['user']),
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
