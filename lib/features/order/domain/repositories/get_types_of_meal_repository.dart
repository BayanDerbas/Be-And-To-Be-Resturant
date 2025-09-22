import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/order/domain/entities/meal_with_types_entity.dart';

abstract class MealTypesRepository {
  Future<Either<Failure,List<MealWithTypesEntity>>> getTyperOfMeal(int meal_id);
}