// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel(
  allCoupons:
      (json['all coupons'] as List<dynamic>?)
          ?.map((e) => CouponDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{'all coupons': instance.allCoupons};

CouponDataModel _$CouponDataModelFromJson(Map<String, dynamic> json) =>
    CouponDataModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      value: json['value'] as String?,
      minOrder: json['min_order'] as String?,
      expiresAt: json['expires_at'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CouponDataModelToJson(CouponDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'value': instance.value,
      'min_order': instance.minOrder,
      'expires_at': instance.expiresAt,
      'is_active': instance.isActive,
      'branch_id': instance.branchId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
