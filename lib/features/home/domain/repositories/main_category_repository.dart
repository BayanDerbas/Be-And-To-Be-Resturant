import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/home/domain/entites/main_category_entity.dart';

abstract class MainCategoryRepository {
  Future<Either<Failure,List<MainCategoryEntity>>> getMainCategories(int branch_id);
}