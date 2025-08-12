import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:web_app/features/auth/data/data_sources/login/login_service.dart';
import 'package:web_app/features/auth/data/data_sources/register/register_service.dart';
import 'package:web_app/features/auth/data/repositories/login/login_repository_impl.dart';
import 'package:web_app/features/auth/data/repositories/register/register_repository_impl.dart';
import 'package:web_app/features/auth/domain/repositories/login/login_repository.dart';
import 'package:web_app/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/register/register_usecase.dart';
import 'package:web_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/register/register_cubit.dart';

import '../../features/auth/domain/repositories/register/register_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  // Data sources
  sl.registerLazySingleton<RegisterService>(() => RegisterService(sl()));
  sl.registerLazySingleton<LoginService>(() => LoginService(sl()));
  // Repositories
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  // Use cases
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  // Cubit
  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(sl()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));
}
