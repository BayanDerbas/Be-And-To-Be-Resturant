part of 'coupon_cubit.dart';

abstract class CouponState extends Equatable {
  const CouponState();

  @override
  List<Object?> get props => [];
}

class CouponInitial extends CouponState {}

class CouponLoading extends CouponState {}

class CouponLoaded extends CouponState {
  final List<CouponEntity> coupons;
  const CouponLoaded(this.coupons);

  @override
  List<Object?> get props => [coupons];
}

class CouponError extends CouponState {
  final String message;
  const CouponError(this.message);

  @override
  List<Object?> get props => [message];
}
