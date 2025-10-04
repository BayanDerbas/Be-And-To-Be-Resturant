import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/features/cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:web_app/features/cart/domain/entities/cart_info_entity.dart';
import '../../../../core/networks/failures.dart';
import '../../domain/entities/update_count_cart_entity.dart';
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

  @override
  Future<Either<Failure, List<CartInfoEntity>>> showCart({required int branch_id}) async{
    try{
      final response = await service.showCart(branch_id);
      print("//////Carts Info//////");
      return Right(response.cartInfo ?? []);
    } on DioException catch(e){
      print("Error Cart Info Cubit : ${e.message}");
      return Left(Failure.fromDioError(e));
    } catch(e){
      print("Error Cart Info Cubit : ${e.toString()}");
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateCountCartEntity>> addOne({required int itemId}) async {
    try {
      final response = await service.addOne(itemId);
      final entity = UpdateCountCartEntity(message: response.isNotEmpty ? response.first : null);
      return Right(entity);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateCountCartEntity>> minusOne({required int itemId}) async {
    try {
      final response = await service.minusOne(itemId);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}



