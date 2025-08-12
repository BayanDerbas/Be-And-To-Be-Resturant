import 'package:equatable/equatable.dart';

class RegisterUserEntity extends Equatable {
  final String? fullname;
  final String? phonenumber;
  final String? role;
  final DateTime created_at;
  final DateTime updated_at;
  final int id;

  RegisterUserEntity({
    required this.fullname,
    required this.phonenumber,
    required this.role,
    required this.created_at,
    required this.updated_at,
    required this.id,
  });

  @override
  List<Object?> get props => [fullname,phonenumber,role,created_at,updated_at,id];
}
