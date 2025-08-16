import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/data/data_sources/logout/logout_service.dart';
import 'package:web_app/features/auth/domain/entities/logout/logout_entity.dart';
import 'package:web_app/features/auth/domain/repositories/logout/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutService logoutService;

  LogoutRepositoryImpl(this.logoutService);
  @override
  Future<Either<Failure, LogoutEntity>> logout(String bearerToken) async {
    try{
      final result = await logoutService.logout(bearerToken);
      return Right(result);
    }
    on DioException catch(e){
      return Left(Failure.fromDioError(e));
    }
    catch(e){
      return Left(Failure('Unexpected error: $e'));
    }
  }
}