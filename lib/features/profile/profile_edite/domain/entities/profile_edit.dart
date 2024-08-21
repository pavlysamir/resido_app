import 'package:equatable/equatable.dart';

class ProfileEdit extends Equatable {
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

  ProfileEdit({
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

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    email,
    emailVerifiedAt,
    code,
    role,
    image,
    phone,
    address,
    createdAt,
    updatedAt,
  ];


}