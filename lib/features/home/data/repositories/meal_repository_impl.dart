import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/home/data/data_services/meal_service.dart';
import 'package:web_app/features/home/domain/entites/meal_entity.dart';
import 'package:web_app/features/home/domain/repositories/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealService service;

  MealRepositoryImpl(this.service);
  @override
  Future<Either<Failure, List<MealEntity>>> getMealsOfCategory(int maincategory_id) async {
    try {
      final result = await service.getMealsOfCategory(maincategory_id);
      return Right(result.data.meals);
    } on DioException catch (dioErr) {
      return Left(Failure.fromDioError(dioErr));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}