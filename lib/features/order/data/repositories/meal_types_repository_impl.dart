import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/order/data/data_sources/meal_types_service.dart';
import 'package:web_app/features/order/domain/entities/meal_with_types_entity.dart';
import 'package:web_app/features/order/domain/repositories/get_types_of_meal_repository.dart';

import '../models/meal_with_types_model.dart';

class MealTypesRepositoryImpl implements MealTypesRepository {
  final MealTypesService service;

  MealTypesRepositoryImpl(this.service);

  @override
  Future<Either<Failure, List<MealWithTypesEntity>>> getTyperOfMeal(int meal_id) async {
    try {
      final response = await service.getTypesOfMeal(meal_id);
      final data = response.data["meals with types"] as List;
      // Normalize backend key 'type' -> 'types' to match our models
      final normalized = data.map((raw) {
        final map = Map<String, dynamic>.from(raw as Map);
        if (map.containsKey('type') && !map.containsKey('types')) {
          map['types'] = map['type'];
        }
        return map;
      }).toList();
      final meals = normalized.map((e) => MealWithTypeModel.fromJson(e)).toList();


      print("✅ [MealTypesRepository] Parsed meals: $meals");

      return Right(meals);
    } catch (e, st) {
      print("❌ [MealTypesRepository] Error: $e\n📌 Stacktrace: $st");
      return Left(Failure(e.toString()));
    }
  }
}
