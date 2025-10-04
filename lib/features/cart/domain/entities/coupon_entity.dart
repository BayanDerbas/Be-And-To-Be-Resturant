import 'package:equatable/equatable.dart';

class CouponEntity extends Equatable {
  final int? id;
  final String? code;
  final String? value;
  final String? minOrder;
  final String? expiresAt;
  final int? isActive;
  final int? branchId;
  final String? createdAt;
  final String? updatedAt;

  const CouponEntity({
    required this.id,
    required this.code,
    required this.value,
    required this.minOrder,
    required this.expiresAt,
    required this.isActive,
    required this.branchId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    code,
    value,
    minOrder,
    expiresAt,
    isActive,
    branchId,
    createdAt,
    updatedAt,
  ];
}
