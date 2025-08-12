import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/features/home/presentation/cubit/header/header_cubit.dart';
import 'package:web_app/features/home/presentation/cubit/urlLauncher/url_launcher_cubit.dart';
import 'config/ResponsiveUI/responsiveConfig.dart';
import 'core/di/injection.dart' as di;
import 'core/routes/appRouter.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'config/theme/app_theme.dart';
import 'features/auth/presentation/cubit/login/login_cubit.dart';
import 'features/auth/presentation/cubit/register/register_cubit.dart';
import 'features/branch/presentation/cubit/branch_cubit.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/home/presentation/cubit/locale/locale_cubit.dart';
import 'features/home/presentation/cubit/products/products_cubit.dart';
import 'features/home/presentation/cubit/typesProduct/types_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => di.sl<LoginCubit>()),
        BlocProvider<RegisterCubit>(create: (_) => di.sl<RegisterCubit>()),
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        BlocProvider<BranchCubit>(create: (_) => BranchCubit()),
        BlocProvider<HeaderCubit>(create: (_) => HeaderCubit()),
        BlocProvider<ProductsCubit>(create: (_) => ProductsCubit()..loadProducts()),
        BlocProvider<ProductTypesCubit>(create: (_) => ProductTypesCubit()),
        BlocProvider<UrlLauncherCubit>(create: (_) => UrlLauncherCubit()),
        BlocProvider<CartCubit>(create: (_) => CartCubit()),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      ],
      child: Builder(
        builder: (context) {
          return ResponsiveConfig(
            context: context,
            child: BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                final lang = locale.languageCode;
                return MaterialApp.router(
                  theme: AppTheme.lightTheme,
                  routerConfig: AppRouter.router,
                  debugShowCheckedModeBanner: false,
                  builder: (context, child) {
                    return Directionality(
                      textDirection: lang == 'ar' ? TextDirection.ltr : TextDirection.rtl,
                      child: ResponsiveConfig.of(context).isDesktop || ResponsiveConfig.of(context).isTablet
                          ? child!
                          : Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: child,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
