import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/branch/data/data_sources/branch_service.dart';
import 'package:web_app/features/branch/domain/entities/branches_entity.dart';
import 'package:web_app/features/branch/domain/repositories/branches_repository.dart';

class BranchesRepositoryImpl implements BranchesRepository{
  final BranchService service;
  BranchesRepositoryImpl(this.service);
  @override
  Future<Either<Failure, BranchesEntity>> getBranches() async {
    try{
      final result = await service.getBranches();
      return Right(result);
    }on DioException catch (e){
      return Left(Failure.fromDioError(e));
    } catch(e){
      return Left(Failure(e.toString()));
    }
  }
}