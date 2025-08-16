import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/branch/data/models/phone_number_model.dart';
import 'package:web_app/features/branch/domain/entities/branch_entity.dart';

part 'branch_model.g.dart';

@JsonSerializable()
class BranchModel extends BranchEntity {
  final int id;
  final String? branch_name;
  final String? image;
  final double? length;
  final double? width;
  @JsonKey(name: 'facebooktoken')
  final String? facebooktoken;
  @JsonKey(name: 'instagramtoken')
  final String? instagramtoken;
  @JsonKey(name: 'created_at')
  final String? created_at;
  @JsonKey(name: 'updated_at')
  final String? updated_at;
  final List<PhoneNumberModel> phonenumbers;

  BranchModel({
    required this.id,
    required this.branch_name,
    required this.image,
    required this.length,
    required this.width,
    required this.facebooktoken,
    required this.instagramtoken,
    required this.created_at,
    required this.updated_at,
    required this.phonenumbers,
  }) : super(
         id: id,
         branch_name: branch_name,
         image: image,
         length: length,
         width: width,
         facebooktoken: facebooktoken,
         instagramtoken: instagramtoken,
         created_at: created_at,
         updated_at: updated_at,
         phonenumbers: phonenumbers,
       );

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
  Map<String, dynamic> toJson() => _$BranchModelToJson(this);
}
