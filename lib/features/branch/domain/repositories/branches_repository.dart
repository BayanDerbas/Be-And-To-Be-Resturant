import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/branch/domain/entities/branches_entity.dart';

abstract class BranchesRepository{
  Future <Either<Failure,BranchesEntity>> getBranches ();
}