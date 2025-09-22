import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/order/domain/entities/meal_with_types_entity.dart';
import 'package:web_app/features/order/domain/repositories/get_types_of_meal_repository.dart';

class GetTypesOfMealUseCase {
  final MealTypesRepository repository;

  GetTypesOfMealUseCase(this.repository);

  Future<Either<Failure, List<MealWithTypesEntity>>> call(int meal_id) async {
    return repository.getTyperOfMeal(meal_id);
  }
}