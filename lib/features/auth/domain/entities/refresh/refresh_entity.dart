import 'package:equatable/equatable.dart';

class RefreshEntity extends Equatable {
  final String? access_token;
  final String? token_type;
  final int? expires_in;

  RefreshEntity({required this.access_token, required this.token_type, required this.expires_in});

  @override
  List<Object?> get props => [access_token,token_type,expires_in];
}