import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/branch/domain/entities/phone_number_entity.dart';

part 'phone_number_model.g.dart';

@JsonSerializable()
class PhoneNumberModel extends PhoneNumberEntity{
  final int id;
  final String? phone;
  final int branch_id;
  final String? created_at;
  final String? updated_at;

  PhoneNumberModel({
    required this.id,
    required this.phone,
    required this.branch_id,
    required this.created_at,
    required this.updated_at,
  }) : super(id: id, phone: phone, branch_id: branch_id, created_at: created_at, updated_at: updated_at);

  factory PhoneNumberModel.fromJson(Map<String,dynamic> json) => _$PhoneNumberModelFromJson(json);
  Map<String,dynamic> toJson() => _$PhoneNumberModelToJson(this);
}
