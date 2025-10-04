import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/cart/domain/entities/cart_info_entity.dart';
import '../repositories/cart_repository.dart';

class CartInfoUseCase{
  final CartRepository repository;
  CartInfoUseCase(this.repository);
   Future<Either<Failure,List<CartInfoEntity>>> call(int branch_id) async {
     return repository.showCart(branch_id: branch_id);
   }
}