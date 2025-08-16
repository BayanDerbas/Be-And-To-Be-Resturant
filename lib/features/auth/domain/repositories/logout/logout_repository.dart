import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/domain/entities/logout/logout_entity.dart';

abstract class LogoutRepository{
  Future<Either<Failure,LogoutEntity>> logout (String bearerToken);
}