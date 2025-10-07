import 'package:equatable/equatable.dart';

class ConfirmSelfOrderEntity extends Equatable {
  final int? originalPrice;
  final String? discount;
  final int? finalPrice;
  final OrderInfoEntity? orderInfo;
  final List<SelfOrderItemEntity>? orderDetails;

  const ConfirmSelfOrderEntity({
    this.originalPrice,
    this.discount,
    this.finalPrice,
    this.orderInfo,
    this.orderDetails,
  });

  @override
  List<Object?> get props => [originalPrice, discount, finalPrice, orderInfo, orderDetails];
}

class OrderInfoEntity extends Equatable {
  final String? note;
  final int? branchId;
  final String? couponId;
  final int? userId;
  final int? itemNumber;
  final int? totalPrice;
  final String? updatedAt;
  final String? createdAt;
  final int? id;
  final List<SelfOrderItemEntity>? selfOrderItems;

  const OrderInfoEntity({
    this.note,
    this.branchId,
    this.couponId,
    this.userId,
    this.itemNumber,
    this.totalPrice,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.selfOrderItems,
  });

  @override
  List<Object?> get props => [
    note,
    branchId,
    couponId,
    userId,
    itemNumber,
    totalPrice,
    updatedAt,
    createdAt,
    id,
    selfOrderItems,
  ];
}

class SelfOrderItemEntity extends Equatable {
  final int? id;
  final int? typeId;
  final int? selfOrderId;
  final int? extra;
  final int? amount;
  final int? price;
  final String? createdAt;
  final String? updatedAt;

  const SelfOrderItemEntity({
    this.id,
    this.typeId,
    this.selfOrderId,
    this.extra,
    this.amount,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, typeId, selfOrderId, extra, amount, price, createdAt, updatedAt];
}
