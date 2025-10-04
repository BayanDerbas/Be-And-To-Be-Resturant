import 'package:dartz/dartz.dart';
import '../../../../core/networks/failures.dart';
import '../entities/add_to_cart_response_entity.dart';
import '../entities/cart_info_entity.dart';
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
  }


