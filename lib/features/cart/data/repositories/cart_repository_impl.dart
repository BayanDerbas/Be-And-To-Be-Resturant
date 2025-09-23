import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/features/cart/domain/entities/add_to_cart_response_entity.dart';
import '../../../../core/networks/failures.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_sources/cart_service.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService service;

  CartRepositoryImpl(this.service);

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCart({
    required int type_id,
    required int amount,
    required int price,
    required int extra,
    required int branch_id,
  }) async {
    try {
      final model = await service.addToCart(type_id, amount, price, extra, branch_id);
      return Right(model);
    } on DioException catch (err) {
      return Left(Failure.fromDioError(err));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}


