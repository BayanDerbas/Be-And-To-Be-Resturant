import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/domain/entities/refresh/refresh_entity.dart';

abstract class RefreshRepository {
  Future<Either<Failure,RefreshEntity>> refresh (String bearerToken);
}