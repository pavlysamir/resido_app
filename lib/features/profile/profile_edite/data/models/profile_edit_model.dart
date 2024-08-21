class ProfileEditModel {
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

  ProfileEditModel({
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

  factory ProfileEditModel.fromJson(Map<String, dynamic> json) {
    return ProfileEditModel(
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

class DataProfileEditModel {
  ProfileEditModel user;
  String token;

  DataProfileEditModel({required this.user, required this.token});

  factory DataProfileEditModel.fromJson(Map<String, dynamic> json) {
    return DataProfileEditModel(
      user: ProfileEditModel.fromJson(json['user']),
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
