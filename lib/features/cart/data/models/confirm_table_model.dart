import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/confirm_table_entity.dart';

part 'confirm_table_model.g.dart';

@JsonSerializable()
class ConfirmTableOrderModel {
  @JsonKey(name: 'original_price')
  final int originalPrice;

  final String discount;

  @JsonKey(name: 'final_price')
  final int finalPrice;

  @JsonKey(name: 'order info')
  final OrderInfoModel orderInfo;

  ConfirmTableOrderModel({
    required this.originalPrice,
    required this.discount,
    required this.finalPrice,
    required this.orderInfo,
  });

  factory ConfirmTableOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmTableOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmTableOrderModelToJson(this);

  ConfirmTableOrderEntity toEntity() => ConfirmTableOrderEntity(
    originalPrice: originalPrice,
    discount: discount,
    finalPrice: finalPrice,
    orderInfo: orderInfo.toEntity(),
  );
}

@JsonSerializable()
class OrderInfoModel {
  final String note;

  @JsonKey(name: 'table_number')
  final String tableNumber;

  @JsonKey(name: 'branch_id')
  final int branchId;

  @JsonKey(name: 'coupon_id')
  final String couponId;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'item_number')
  final int itemNumber;

  @JsonKey(name: 'total_price')
  final int totalPrice;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'created_at')
  final String createdAt;

  final int id;

  OrderInfoModel({
    required this.note,
    required this.tableNumber,
    required this.branchId,
    required this.couponId,
    required this.userId,
    required this.itemNumber,
    required this.totalPrice,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInfoModelToJson(this);

  OrderInfoEntity toEntity() => OrderInfoEntity(
    note: note,
    tableNumber: tableNumber,
    branchId: branchId,
    couponId: couponId,
    userId: userId,
    itemNumber: itemNumber,
    totalPrice: totalPrice,
    updatedAt: updatedAt,
    createdAt: createdAt,
    id: id,
  );
}
