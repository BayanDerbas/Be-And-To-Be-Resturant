import 'package:equatable/equatable.dart';

class LoginUserDataEntity extends Equatable {
  final int id;
  final String? fullname;
  final String? phonenumber;
  final String? role;
  final String? phone_verified_at;
  final DateTime created_at;
  final DateTime updated_at;

  LoginUserDataEntity({
    required this.id,
    this.fullname,
    this.phonenumber,
    this.role,
    this.phone_verified_at,
    required this.created_at,
    required this.updated_at,
  });

  factory LoginUserDataEntity.fromJson(Map<String, dynamic> json) {
    return LoginUserDataEntity(
      id: json['id'],
      fullname: json['fullname'],
      phonenumber: json['phonenumber'],
      role: json['role'],
      phone_verified_at: json['phone_verified_at'] ?? '',
      created_at: json['created_at'],
      updated_at: json['updated_at'],

    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullname': fullname,
    'phonenumber': phonenumber,
    'role': role,
    'phone_verified_at': phone_verified_at,
    'created_at': created_at.toIso8601String(),
    'updated_at': updated_at.toIso8601String(),
  };

  @override
  List<Object?> get props => [
    id,
    fullname,
    phonenumber,
    role,
    phone_verified_at,
    created_at,
    updated_at,
  ];
}
