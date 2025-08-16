import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/auth/domain/entities/refresh/refresh_entity.dart';

part 'refresh_model.g.dart';

@JsonSerializable()
class RefreshModel extends RefreshEntity {
  final String? access_token;
  final String? token_type;
  final int? expires_in;

  RefreshModel({
    required this.access_token,
    required this.token_type,
    required this.expires_in,
  }) : super(
         access_token: access_token,
         token_type: token_type,
         expires_in: expires_in,
       );

  factory RefreshModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshModelFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshModelToJson(this);
}
