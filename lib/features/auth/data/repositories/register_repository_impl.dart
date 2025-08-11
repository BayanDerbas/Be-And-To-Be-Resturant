import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/data/data_sources/register_service.dart';
import 'package:web_app/features/auth/domain/entities/register_user.dart';
import 'package:web_app/features/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterService service;

  RegisterRepositoryImpl(this.service);
  @override
  Future<Either<Failure, RegisterUser>> register({
    required String fullname,
    required String phonenumber,
    required String password,
  }) async {
    try{
      final response = await service.register(fullname: fullname, phonenumber: phonenumber, password: password);
      return Right(response);
    } on DioException catch(e){
      return Left(Failure.fromDioError(e));
    }
    catch (e){
      return Left(Failure('Unexpected error: $e'));
    }
  }
}
