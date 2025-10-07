import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/features/cart/data/data_sources/coupon_service.dart';
import 'package:web_app/features/cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:web_app/features/cart/domain/entities/cart_info_entity.dart';
import 'package:web_app/features/cart/domain/entities/confirm_delivery_entity.dart';
import 'package:web_app/features/cart/domain/entities/confirm_self_order_entity.dart';
import 'package:web_app/features/cart/domain/entities/confirm_table_entity.dart';
import '../../../../core/networks/failures.dart';
import '../../domain/entities/coupon_entity.dart';
import '../../domain/entities/update_count_cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_sources/cart_service.dart';
import '../models/confirm_table_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService service;
  final CouponService service_;

  CartRepositoryImpl(this.service, this.service_);

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCart({
    required int type_id,
    required int amount,
    required int price,
    required int extra,
    required int branch_id,
  }) async {
    try {
      final model = await service.addToCart(
        type_id,
        amount,
        price,
        extra,
        branch_id,
      );
      return Right(model);
    } on DioException catch (err) {
      return Left(Failure.fromDioError(err));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartInfoEntity>>> showCart({
    required int branch_id,
  }) async {
    try {
      final response = await service.showCart(branch_id);
      print("//////Carts Info//////");
      return Right(response.cartInfo ?? []);
    } on DioException catch (e) {
      print("Error Cart Info Cubit : ${e.message}");
      return Left(Failure.fromDioError(e));
    } catch (e) {
      print("Error Cart Info Cubit : ${e.toString()}");
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateCountCartEntity>> addOne({
    required int itemId,
  }) async {
    try {
      final response = await service.addOne(itemId);
      final entity = UpdateCountCartEntity(
        message: response.isNotEmpty ? response.first : null,
      );
      return Right(entity);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateCountCartEntity>> minusOne({
    required int itemId,
  }) async {
    try {
      final response = await service.minusOne(itemId);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CouponEntity>>> showAllCoupon({
    required int branch_id,
  }) async {
    try {
      final response = await service_.getAllCoupon(branch_id: branch_id);
      final coupons = response.toEntity();
      return Right(coupons);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ConfirmDeliveryEntity>> confirmDeliveryOrder({
    required int cartId,
    required String note,
    required String address,
    String? couponId,
  }) async {
    try {
      final response = await service.confirmDeliveryOrder(
        cartId,
        note,
        address,
        couponId,
      );
      final entity = response.toEntity();
      return Right(entity);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ConfirmTableOrderEntity>> confirmTableOrder({required int cartId, required String tableNumber, required String note, String? couponId}) async {
      try {
        final response = await service.confirmTableOrder(
          cartId,
          tableNumber,
          couponId,
          note,
        );
        return Right(response.toEntity());
      } on DioException catch (e) {
        return Left(Failure.fromDioError(e));
      } catch (e) {
        return Left(Failure(e.toString()));
      }
  }

  @override
  Future<Either<Failure, ConfirmSelfOrderEntity>> confirmSelfOrder({required int cartId, required String note, String? couponId}) async {
    try {
      final response = await service.confirmSelfOrder(couponId, cartId, note);
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

}
