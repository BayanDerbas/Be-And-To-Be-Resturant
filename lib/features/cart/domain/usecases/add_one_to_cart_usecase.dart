import 'package:dartz/dartz.dart';
import 'package:web_app/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/networks/failures.dart';
import '../entities/update_count_cart_entity.dart';

class AddOneToCartUseCase {
  final CartRepository repository;
  AddOneToCartUseCase(this.repository);

  Future<Either<Failure, UpdateCountCartEntity>> call(int itemId) async {
    return await repository.addOne(itemId: itemId);
  }
}