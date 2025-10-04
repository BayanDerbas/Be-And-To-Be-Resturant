import 'package:dartz/dartz.dart';
import 'package:web_app/features/cart/domain/entities/coupon_entity.dart';
import 'package:web_app/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/networks/failures.dart';

class CouponsUseCase {
  final CartRepository repository;
  CouponsUseCase(this.repository);

  Future<Either<Failure, List<CouponEntity>>> call(int branch_id){
    return repository.showAllCoupon(branch_id: branch_id);
  }
}