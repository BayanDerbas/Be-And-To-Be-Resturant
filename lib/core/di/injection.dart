import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:web_app/features/auth/data/data_sources/register_service.dart';
import 'package:web_app/features/auth/data/repositories/register_repository_impl.dart';
import 'package:web_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:web_app/features/auth/presentation/cubit/register/register_cubit.dart';

import '../../features/auth/domain/repositories/register_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  // Data sources
  sl.registerLazySingleton<RegisterService>(() => RegisterService(sl()));
  // Repositories
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl()));
  // Use cases
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  // Cubit
  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(sl()));
}
