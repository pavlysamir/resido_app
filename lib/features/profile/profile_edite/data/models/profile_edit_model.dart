class DataProfileEditModel {
  int id;
  String name;
  String email;
  String? emailVerifiedAt;
  String? code;
  String role;
  String image;
  String? phone;
  String? address;
  String createdAt;
  String updatedAt;

  DataProfileEditModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.code,
    required this.role,
    required this.image,
    this.phone,
    this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a User object from JSON
  factory DataProfileEditModel.fromJson(Map<String, dynamic> json) {
    return DataProfileEditModel(
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

  // Method to convert a User object to JSON
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
