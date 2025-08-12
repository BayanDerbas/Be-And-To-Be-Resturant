import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/auth/domain/entities/login/login_user_data_entity.dart';

part 'login_user_data.g.dart';

@JsonSerializable()
class LoginUserData extends LoginUserDataEntity{
  final int id;
  final String? fullname;
  final String? phonenumber;
  final String? role;
  final String? phone_verified_at;
  final DateTime created_at;
  final DateTime updated_at;

  LoginUserData({
    required this.id,
    required this.fullname,
    required this.phonenumber,
    required this.role,
    required this.phone_verified_at,
    required this.created_at,
    required this.updated_at,
  }) : super(
    id: id,
    fullname: fullname,
    phonenumber: phonenumber,
    role: role,
    phone_verified_at: phone_verified_at,
    created_at: created_at,
    updated_at: updated_at
  );

  factory LoginUserData.fromJson(Map<String,dynamic> json) => _$LoginUserDataFromJson(json);
  Map<String,dynamic> toJson() => _$LoginUserDataToJson(this);
}
