// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmTableOrderModel _$ConfirmTableOrderModelFromJson(
  Map<String, dynamic> json,
) => ConfirmTableOrderModel(
  originalPrice: (json['original_price'] as num).toInt(),
  discount: json['discount'] as String,
  finalPrice: (json['final_price'] as num).toInt(),
  orderInfo: OrderInfoModel.fromJson(
    json['order info'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ConfirmTableOrderModelToJson(
  ConfirmTableOrderModel instance,
) => <String, dynamic>{
  'original_price': instance.originalPrice,
  'discount': instance.discount,
  'final_price': instance.finalPrice,
  'order info': instance.orderInfo,
};

OrderInfoModel _$OrderInfoModelFromJson(Map<String, dynamic> json) =>
    OrderInfoModel(
      note: json['note'] as String,
      tableNumber: json['table_number'] as String,
      branchId: (json['branch_id'] as num).toInt(),
      couponId: json['coupon_id'] as String,
      userId: (json['user_id'] as num).toInt(),
      itemNumber: (json['item_number'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$OrderInfoModelToJson(OrderInfoModel instance) =>
    <String, dynamic>{
      'note': instance.note,
      'table_number': instance.tableNumber,
      'branch_id': instance.branchId,
      'coupon_id': instance.couponId,
      'user_id': instance.userId,
      'item_number': instance.itemNumber,
      'total_price': instance.totalPrice,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
