import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/home/domain/entites/meal_entity.dart';
import 'package:web_app/features/home/domain/repositories/meal_repository.dart';

class GetMealOfCategoryUseCase {
  final MealRepository repository;

  GetMealOfCategoryUseCase(this.repository);
  Future<Either<Failure,List<MealEntity>>> call(int maincategory_id) {
    return repository.getMealsOfCategory(maincategory_id);
  }
}