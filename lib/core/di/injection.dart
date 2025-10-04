import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:web_app/core/networks/dio_factory.dart';
import 'package:web_app/features/auth/data/data_sources/login/login_service.dart';
import 'package:web_app/features/auth/data/data_sources/logout/logout_service.dart';
import 'package:web_app/features/auth/data/data_sources/refresh/refresh_service.dart';
import 'package:web_app/features/auth/data/data_sources/register/register_service.dart';
import 'package:web_app/features/auth/data/repositories/login/login_repository_impl.dart';
import 'package:web_app/features/auth/data/repositories/logout/logout_repository_impl.dart';
import 'package:web_app/features/auth/data/repositories/refresh/refresh_respository_impl.dart';
import 'package:web_app/features/auth/data/repositories/register/register_repository_impl.dart';
import 'package:web_app/features/auth/domain/repositories/login/login_repository.dart';
import 'package:web_app/features/auth/domain/repositories/logout/logout_repository.dart';
import 'package:web_app/features/auth/domain/repositories/refresh/refresh_repository.dart';
import 'package:web_app/features/auth/domain/repositories/register/register_repository.dart';
import 'package:web_app/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/logout/logout_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/refresh/refresh_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/register/register_usecase.dart';
import 'package:web_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/refresh/refresh_cubit.dart';
import 'package:web_app/features/branch/data/data_sources/branch_service.dart';
import 'package:web_app/features/branch/data/repositories/branches_repository_impl.dart';
import 'package:web_app/features/branch/domain/repositories/branches_repository.dart';
import 'package:web_app/features/branch/domain/usecases/branches_usecase.dart';
import 'package:web_app/features/branch/presentation/cubit/branch_cubit.dart';
import 'package:web_app/features/cart/data/data_sources/coupon_service.dart';
import 'package:web_app/features/cart/domain/usecases/cart_info_usecase.dart';
import 'package:web_app/features/cart/domain/usecases/coupons_usecase.dart';
import 'package:web_app/features/cart/domain/usecases/minus_one_to_cart_usecase.dart';
import 'package:web_app/features/cart/presentation/cubit/confirm_delivery_cubit.dart';
import 'package:web_app/features/cart/presentation/cubit/coupon_cubit.dart';
import 'package:web_app/features/cart/presentation/cubit/update_count_cart_cubit.dart';
import 'package:web_app/features/home/data/data_services/categories_service.dart';
import 'package:web_app/features/home/data/repositories/main_category_repository_impl.dart';
import 'package:web_app/features/home/domain/repositories/main_category_repository.dart';
import 'package:web_app/features/home/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:web_app/features/order/data/data_sources/meal_types_service.dart';
import 'package:web_app/features/order/data/repositories/meal_types_repository_impl.dart';
import 'package:web_app/features/order/domain/repositories/get_types_of_meal_repository.dart';
import '../../features/cart/domain/usecases/add_one_to_cart_usecase.dart';
import '../../features/cart/domain/usecases/confirm_delivery_usecase.dart';
import '../../features/home/data/data_services/meal_service.dart';
import '../../features/home/data/repositories/meal_repository_impl.dart';
import '../../features/home/domain/repositories/meal_repository.dart';
import '../../features/home/domain/usecases/get_main_categories_usecase.dart';
import '../../features/home/presentation/cubit/products/products_cubit.dart';
import '../../features/home/presentation/cubit/typesProduct/types_product_cubit.dart';
import '../../features/order/presentation/cubit/meal_types_cubit/meal_types_cubit.dart';
import '../../features/order/domain/usecases/get_types_of_meal_usecase.dart';
import '../../features/cart/data/data_sources/cart_service.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/domain/usecases/add_to_cart_usecase.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ============================
  // Refresh repo
  // ============================
  sl.registerLazySingletonAsync<RefreshService>(() async {
    final dio = await DioFactory.getDio();
    return RefreshService(dio);
  });

  sl.registerLazySingletonAsync<RefreshRepository>(() async {
    final service = await sl.getAsync<RefreshService>();
    return RefreshRepositoryImpl(service);
  });

  // ============================
  // Dio with Refresh
  // ============================
  sl.registerLazySingletonAsync<Dio>(() async {
    final refreshRepo = await sl.getAsync<RefreshRepository>();
    return DioFactory.createDioWithRefresh(
      refreshRepo as RefreshRepositoryImpl,
    );
  });

  // ============================
  // Data Sources
  // ============================
  sl.registerLazySingletonAsync<RegisterService>(() async {
    final dio = await sl.getAsync<Dio>();
    return RegisterService(dio);
  });

  sl.registerLazySingletonAsync<LoginService>(() async {
    final dio = await sl.getAsync<Dio>();
    return LoginService(dio);
  });

  sl.registerLazySingletonAsync<LogoutService>(() async {
    final dio = await sl.getAsync<Dio>();
    return LogoutService(dio);
  });

  sl.registerLazySingletonAsync<BranchService>(() async {
    final dio = await sl.getAsync<Dio>();
    return BranchService(dio);
  });

  sl.registerLazySingletonAsync<CategoriesService>(() async {
    final dio = await sl.getAsync<Dio>();
    return CategoriesService(dio);
  });

  sl.registerLazySingletonAsync<MealService>(() async {
    final dio = await sl.getAsync<Dio>();
    return MealService(dio);
  });
  sl.registerLazySingletonAsync<MealTypesService>(() async {
    final dio = await sl.getAsync<Dio>();
    return MealTypesService(dio);
  });
  sl.registerLazySingletonAsync<CartService>(() async {
    final dio = await sl.getAsync<Dio>();
    return CartService(dio);
  });
  sl.registerLazySingletonAsync<CouponService>(() async {
    final dio = await sl.getAsync<Dio>();
    return CouponService(dio);
  });
  // ============================
  // Repositories
  // ============================
  sl.registerLazySingletonAsync<RegisterRepository>(() async {
    final service = await sl.getAsync<RegisterService>();
    return RegisterRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<LoginRepository>(() async {
    final service = await sl.getAsync<LoginService>();
    return LoginRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<LogoutRepository>(() async {
    final service = await sl.getAsync<LogoutService>();
    return LogoutRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<BranchesRepository>(() async {
    final service = await sl.getAsync<BranchService>();
    return BranchesRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<MainCategoryRepository>(() async {
    final service = await sl.getAsync<CategoriesService>();
    return MainCategoriesRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<MealRepository>(() async {
    final service = await sl.getAsync<MealService>();
    return MealRepositoryImpl(service);
  });
  sl.registerLazySingletonAsync<MealTypesRepository>(() async {
    final service = await sl.getAsync<MealTypesService>();
    return MealTypesRepositoryImpl(service);
  });
  sl.registerLazySingletonAsync<CartRepository>(() async {
    final service = await sl.getAsync<CartService>();
    final service_ = await sl.getAsync<CouponService>();
    return CartRepositoryImpl(service,service_);
  });
  // ============================
  // Use Cases
  // ============================
  sl.registerLazySingletonAsync<RegisterUseCase>(() async {
    final repo = await sl.getAsync<RegisterRepository>();
    return RegisterUseCase(repo);
  });

  sl.registerLazySingletonAsync<LoginUseCase>(() async {
    final repo = await sl.getAsync<LoginRepository>();
    return LoginUseCase(repo);
  });

  sl.registerLazySingletonAsync<LogoutUseCase>(() async {
    final repo = await sl.getAsync<LogoutRepository>();
    return LogoutUseCase(repo);
  });

  sl.registerLazySingletonAsync<RefreshUseCase>(() async {
    final repo = await sl.getAsync<RefreshRepository>();
    return RefreshUseCase(repo);
  });

  sl.registerLazySingletonAsync<BranchesUseCase>(() async {
    final repo = await sl.getAsync<BranchesRepository>();
    return BranchesUseCase(repo);
  });

  sl.registerLazySingletonAsync<GetMainCategoriesUseCase>(() async {
    final repo = await sl.getAsync<MainCategoryRepository>();
    return GetMainCategoriesUseCase(repo);
  });

  sl.registerLazySingletonAsync<GetMealOfCategoryUseCase>(() async {
    final repo = await sl.getAsync<MealRepository>();
    return GetMealOfCategoryUseCase(repo);
  });
  sl.registerLazySingletonAsync<GetTypesOfMealUseCase>(() async {
    final repo = await sl.getAsync<MealTypesRepository>();
    return GetTypesOfMealUseCase(repo);
  });
  sl.registerLazySingletonAsync<AddToCartUseCase>(() async {
    final repo = await sl.getAsync<CartRepository>();
    return AddToCartUseCase(repo);
  });
  sl.registerLazySingletonAsync<CartInfoUseCase>(() async {
    final repo = await sl.getAsync<CartRepository>();
    return CartInfoUseCase(repo);
  });
  sl.registerLazySingletonAsync<AddOneToCartUseCase>(() async {
    final repo = await sl.getAsync<CartRepository>();
    return AddOneToCartUseCase(repo);
  });
  sl.registerLazySingletonAsync<MinusOneFromCartUseCase>(() async {
    final repo = await sl.getAsync<CartRepository>();
    return MinusOneFromCartUseCase(repo);
  });
  sl.registerLazySingletonAsync<CouponsUseCase>(() async {
    final repo = await sl.getAsync<CartRepository>();
    return CouponsUseCase(repo);
  });
  sl.registerLazySingletonAsync<ConfirmDeliveryUseCase>(() async {
    final repo = await sl.getAsync<CartRepository>();
    return ConfirmDeliveryUseCase(repo);
  });
  // ============================
  // Cubits
  // ============================
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<LoginUseCase>()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl<RegisterUseCase>()));
  sl.registerFactory<LogoutCubit>(() => LogoutCubit(sl<LogoutUseCase>()));
  sl.registerFactory<RefreshCubit>(() => RefreshCubit(sl<RefreshUseCase>()));
  sl.registerFactory<BranchCubit>(() => BranchCubit(sl<BranchesUseCase>()));
  sl.registerFactory<ProductsCubit>(
    () => ProductsCubit(sl<GetMainCategoriesUseCase>()),
  );
  sl.registerFactory<ProductTypesCubit>(
    () => ProductTypesCubit(sl<GetMealOfCategoryUseCase>()),
  );
  sl.registerFactory<MealTypesCubit>(
    () => MealTypesCubit(sl<GetTypesOfMealUseCase>()),
  );
  sl.registerFactory<CartCubit>(
    () => CartCubit(sl<CartRepository>(), sl<CartInfoUseCase>()),
  );
  sl.registerFactory<UpdateCountCartCubit>(
        () => UpdateCountCartCubit(addOneUseCase: sl<AddOneToCartUseCase>(),minusOneUseCase: sl<MinusOneFromCartUseCase>()),
  );
  sl.registerFactory<CouponCubit>(
    () => CouponCubit(sl<CouponsUseCase>()),
  );
  sl.registerFactory<ConfirmDeliveryCubit>(
        () => ConfirmDeliveryCubit(sl<ConfirmDeliveryUseCase>()),
  );
}
