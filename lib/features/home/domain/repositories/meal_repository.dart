import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/home/domain/entites/meal_entity.dart';

abstract class MealRepository {
  Future<Either<Failure,List<MealEntity>>> getMealsOfCategory (int maincategory_id);
}