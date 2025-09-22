import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/core/firebase/firebase_initializer.dart';
import 'package:web_app/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:web_app/features/home/domain/usecases/get_main_categories_usecase.dart';
import 'package:web_app/features/home/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:web_app/features/home/presentation/cubit/header/header_cubit.dart';
import 'package:web_app/features/home/presentation/cubit/urlLauncher/url_launcher_cubit.dart';
import 'package:web_app/features/notifications/data/services/notification_service.dart';
import 'package:web_app/features/order/domain/usecases/get_types_of_meal_usecase.dart';
import 'package:web_app/features/order/presentation/cubit/meal_types_cubit/meal_types_cubit.dart';
import 'config/ResponsiveUI/responsiveConfig.dart';
import 'core/di/injection.dart' as di;
import 'core/routes/appRouter.dart';
import 'features/auth/domain/usecases/login/login_usecase.dart';
import 'features/auth/domain/usecases/logout/logout_usecase.dart';
import 'features/auth/domain/usecases/refresh/refresh_usecase.dart';
import 'features/auth/domain/usecases/register/register_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'config/theme/app_theme.dart';
import 'features/auth/presentation/cubit/login/login_cubit.dart';
import 'features/auth/presentation/cubit/refresh/refresh_cubit.dart';
import 'features/auth/presentation/cubit/register/register_cubit.dart';
import 'features/branch/domain/usecases/branches_usecase.dart';
import 'features/branch/presentation/cubit/branch_cubit.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/home/presentation/cubit/locale/locale_cubit.dart';
import 'features/home/presentation/cubit/products/products_cubit.dart';
import 'features/home/presentation/cubit/typesProduct/types_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.init();
  await di.init();
  await NotificationService().initNotifications();
  // Wait for all async dependencies
  await di.sl.isReady<Dio>();
  await di.sl.isReady<LoginUseCase>();
  await di.sl.isReady<RegisterUseCase>();
  await di.sl.isReady<LogoutUseCase>();
  await di.sl.isReady<RefreshUseCase>();
  await di.sl.isReady<BranchesUseCase>();
  await di.sl.isReady<GetMainCategoriesUseCase>();
  await di.sl.isReady<GetMealOfCategoryUseCase>();
  await di.sl.isReady<GetTypesOfMealUseCase>();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BranchCubit>(create: (_) => di.sl<BranchCubit>()),
        BlocProvider<RefreshCubit>(create:(_) => di.sl<RefreshCubit>()),
        BlocProvider<LogoutCubit>(create: (_) => di.sl<LogoutCubit>()),
        BlocProvider<LoginCubit>(create: (_) => di.sl<LoginCubit>()),
        BlocProvider<RegisterCubit>(create: (_) => di.sl<RegisterCubit>()),
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        BlocProvider<HeaderCubit>(create: (_) => HeaderCubit()),
        BlocProvider<ProductsCubit>(create: (_) => di.sl<ProductsCubit>()),
        BlocProvider<ProductTypesCubit>(create: (_) => di.sl<ProductTypesCubit>()),
        BlocProvider<MealTypesCubit>(create: (_) => di.sl<MealTypesCubit>()),
        BlocProvider<UrlLauncherCubit>(create: (_) => UrlLauncherCubit()),
        BlocProvider<CartCubit>(create: (_) => CartCubit()),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      ],
      child: Builder(
        builder: (context) {
          return ResponsiveConfig(
            context: context,
            child: MaterialApp.router(
              theme: AppTheme.lightTheme,
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return ResponsiveConfig.of(context).isDesktop ||
                    ResponsiveConfig.of(context).isTablet
                    ? child!
                    : Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: child,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
