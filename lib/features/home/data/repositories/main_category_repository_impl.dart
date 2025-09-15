import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/home/data/data_services/categories_service.dart';
import 'package:web_app/features/home/domain/entites/main_category_entity.dart';
import 'package:web_app/features/home/domain/repositories/main_category_repository.dart';

class MainCategoriesRepositoryImpl implements MainCategoryRepository {
  final CategoriesService service;

  MainCategoriesRepositoryImpl(this.service);
  @override
  Future<Either<Failure, List<MainCategoryEntity>>> getMainCategories(
    int branch_id,
  ) async {
    try {
      final response = await service.getCategories(branch_id);
      final categories = response.data.allCategories.map(
        (model) => MainCategoryEntity(
          id: model.id,
          name: model.name,
          image: model.image,
          branch_id: model.branch_id,
        ),
      ).toList();
      return Right(categories);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
