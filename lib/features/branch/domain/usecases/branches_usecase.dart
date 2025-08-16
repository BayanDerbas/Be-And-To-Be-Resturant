import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/branch/domain/entities/branches_entity.dart';
import 'package:web_app/features/branch/domain/repositories/branches_repository.dart';

class BranchesUseCase{
  final BranchesRepository repository;

  BranchesUseCase(this.repository);

  Future<Either<Failure,BranchesEntity>> call (){
    return repository.getBranches();
  }
}