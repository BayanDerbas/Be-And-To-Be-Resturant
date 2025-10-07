import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/confirm_self_order_entity.dart';

part 'confirm_self_order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ConfirmSelfOrderModel extends ConfirmSelfOrderEntity {
  @JsonKey(name: 'original_price')
  final int? originalPriceModel;

  final String? discount;

  @JsonKey(name: 'final_price')
  final int? finalPriceModel;

  @JsonKey(name: 'order info')
  final OrderInfoModel? orderInfoModel;

  @JsonKey(name: 'order details')
  final List<SelfOrderItemModel>? orderDetailsModel;

  const ConfirmSelfOrderModel({
    this.originalPriceModel,
    this.discount,
    this.finalPriceModel,
    this.orderInfoModel,
    this.orderDetailsModel,
  }) : super(
    originalPrice: originalPriceModel,
    discount: discount,
    finalPrice: finalPriceModel,
    orderInfo: orderInfoModel,
    orderDetails: orderDetailsModel,
  );

  factory ConfirmSelfOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmSelfOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmSelfOrderModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderInfoModel extends OrderInfoEntity {
  final String? note;

  @JsonKey(name: 'branch_id')
  final int? branchIdModel;

  @JsonKey(name: 'coupon_id')
  final String? couponIdModel;

  @JsonKey(name: 'user_id')
  final int? userIdModel;

  @JsonKey(name: 'item_number')
  final int? itemNumberModel;

  @JsonKey(name: 'total_price')
  final int? totalPriceModel;

  @JsonKey(name: 'updated_at')
  final String? updatedAtModel;

  @JsonKey(name: 'created_at')
  final String? createdAtModel;

  final int? id;

  @JsonKey(name: 'selforderitem')
  final List<SelfOrderItemModel>? selfOrderItemsModel;

  const OrderInfoModel({
    this.note,
    this.branchIdModel,
    this.couponIdModel,
    this.userIdModel,
    this.itemNumberModel,
    this.totalPriceModel,
    this.updatedAtModel,
    this.createdAtModel,
    this.id,
    this.selfOrderItemsModel,
  }) : super(
    note: note,
    branchId: branchIdModel,
    couponId: couponIdModel,
    userId: userIdModel,
    itemNumber: itemNumberModel,
    totalPrice: totalPriceModel,
    updatedAt: updatedAtModel,
    createdAt: createdAtModel,
    id: id,
    selfOrderItems: selfOrderItemsModel,
  );

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInfoModelToJson(this);
}

@JsonSerializable()
class SelfOrderItemModel extends SelfOrderItemEntity {
  final int? id;

  @JsonKey(name: 'type_id')
  final int? typeIdModel;

  @JsonKey(name: 'self_order_id')
  final int? selfOrderIdModel;

  final int? extra;
  final int? amount;
  final int? price;

  @JsonKey(name: 'created_at')
  final String? createdAtModel;

  @JsonKey(name: 'updated_at')
  final String? updatedAtModel;

  const SelfOrderItemModel({
    this.id,
    this.typeIdModel,
    this.selfOrderIdModel,
    this.extra,
    this.amount,
    this.price,
    this.createdAtModel,
    this.updatedAtModel,
  }) : super(
    id: id,
    typeId: typeIdModel,
    selfOrderId: selfOrderIdModel,
    extra: extra,
    amount: amount,
    price: price,
    createdAt: createdAtModel,
    updatedAt: updatedAtModel,
  );

  factory SelfOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$SelfOrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelfOrderItemModelToJson(this);
}
