import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/data/models/refresh/refresh_model.dart';
import 'package:web_app/features/auth/domain/repositories/refresh/refresh_repository.dart';
import '../../data_sources/refresh/refresh_service.dart';

class RefreshRepositoryImpl implements RefreshRepository {
  final RefreshService service;

  RefreshRepositoryImpl(this.service);
  @override
  Future<Either<Failure, RefreshModel>> refresh(String bearerToken) async {
    try{
      final result = await service.refresh(bearerToken);
      print("Refresh Token API response: ${result.toJson()}");
      return Right(result);
    }
    on DioException catch (e){
      return Left(Failure.fromDioError(e));
    }
    catch (e){
      return Left(Failure("Unexpected error : ${e}"));
    }
  }
}