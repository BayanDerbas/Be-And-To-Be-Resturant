import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/home/domain/entites/main_category_entity.dart';
import 'package:web_app/features/home/domain/repositories/main_category_repository.dart';

class GetMainCategoriesUseCase {
  final MainCategoryRepository repository;

  GetMainCategoriesUseCase(this.repository);

  Future<Either<Failure,List<MainCategoryEntity>>> call(int branch_id){
    return repository.getMainCategories(branch_id);
  }
}