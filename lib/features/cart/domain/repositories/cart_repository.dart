import 'package:dartz/dartz.dart';
import 'package:web_app/features/cart/data/models/coupon_model.dart';
import 'package:web_app/features/cart/domain/entities/coupon_entity.dart';
import '../../../../core/networks/failures.dart';
import '../entities/add_to_cart_response_entity.dart';
import '../entities/cart_info_entity.dart';
import '../entities/confirm_delivery_entity.dart';
import '../entities/update_count_cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, AddToCartResponseEntity>> addToCart({
    required int type_id,
    required int amount,
    required int price,
    required int extra,
    required int branch_id,
  });

  Future<Either<Failure,List<CartInfoEntity>>> showCart({
    required int branch_id,
});

  Future<Either<Failure, UpdateCountCartEntity>> addOne({required int itemId});
  Future<Either<Failure, UpdateCountCartEntity>> minusOne({required int itemId});
  Future<Either<Failure,List<CouponEntity>>> showAllCoupon({required int branch_id});
  Future<Either<Failure, ConfirmDeliveryEntity>> confirmDeliveryOrder({
    required int cartId,
    required String note,
    required String address,
    String? couponId,
  });

}


