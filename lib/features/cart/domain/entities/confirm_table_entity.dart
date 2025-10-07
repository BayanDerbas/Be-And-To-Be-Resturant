import 'package:equatable/equatable.dart';

  class ConfirmTableOrderEntity extends Equatable {
  final int originalPrice;
  final String discount;
  final int finalPrice;
  final OrderInfoEntity orderInfo;

  const ConfirmTableOrderEntity({
  required this.originalPrice,
  required this.discount,
  required this.finalPrice,
  required this.orderInfo,
  });

  @override
  List<Object?> get props => [originalPrice, discount, finalPrice, orderInfo];
  }

  class OrderInfoEntity extends Equatable {
  final String note;
  final String tableNumber;
  final int branchId;
  final String couponId;
  final int userId;
  final int itemNumber;
  final int totalPrice;
  final String updatedAt;
  final String createdAt;
  final int id;

  const OrderInfoEntity({
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

  @override
  List<Object?> get props => [
  note,
  tableNumber,
  branchId,
  couponId,
  userId,
  itemNumber,
  totalPrice,
  updatedAt,
  createdAt,
  id,
  ];

}