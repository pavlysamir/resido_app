class DataProfileEditModel {
  int id;
  String name;
  String email;
  String? emailVerifiedAt;
  String role;
  String image;
  String? phone;
  String? address;

  DataProfileEditModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    required this.image,
    this.phone,
    this.address,
  });

  // Factory method to create a User object from JSON
  factory DataProfileEditModel.fromJson(Map<String, dynamic> json) {
    return DataProfileEditModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      role: json['role'],
      image: json['image'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  // Method to convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'role': role,
      'image': image,
      'phone': phone,
      'address': address,
    };
  }
}