import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/coupon_entity.dart';

part 'coupon_model.g.dart';

@JsonSerializable()
class CouponModel {
  @JsonKey(name: 'all coupons')
  final List<CouponDataModel>? allCoupons;

  CouponModel({this.allCoupons});

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);

  List<CouponEntity> toEntity() =>
      allCoupons?.map((e) => e.toEntity()).toList() ?? [];
}

@JsonSerializable()
class CouponDataModel {
  final int? id;
  final String? code;
  final String? value;
  @JsonKey(name: 'min_order')
  final String? minOrder;
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  @JsonKey(name: 'is_active')
  final int? isActive;
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  CouponDataModel({
    this.id,
    this.code,
    this.value,
    this.minOrder,
    this.expiresAt,
    this.isActive,
    this.branchId,
    this.createdAt,
    this.updatedAt,
  });

  factory CouponDataModel.fromJson(Map<String, dynamic> json) =>
      _$CouponDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponDataModelToJson(this);

  CouponEntity toEntity() => CouponEntity(
    id: id,
    code: code,
    value: value,
    minOrder: minOrder,
    expiresAt: expiresAt,
    isActive: isActive,
    branchId: branchId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

// import 'package:json_annotation/json_annotation.dart';
// import '../../domain/entities/coupon_entity.dart';
//
// part 'coupon_model.g.dart';
//
// @JsonSerializable()
// class CouponModel extends CouponEntity {
//   const CouponModel({
//     required int? id,
//     required String? code,
//     required String? value,
//     required String? minOrder,
//     required String? expiresAt,
//     required int? isActive,
//     required int? branchId,
//     required String? createdAt,
//     required String? updatedAt,
//   }) : super(
//     id: id,
//     code: code,
//     value: value,
//     minOrder: minOrder,
//     expiresAt: expiresAt,
//     isActive: isActive,
//     branchId: branchId,
//     createdAt: createdAt,
//     updatedAt: updatedAt,
//   );
//
//   factory CouponModel.fromJson(Map<String, dynamic> json) =>
//       _$CouponModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CouponModelToJson(this);
// }
