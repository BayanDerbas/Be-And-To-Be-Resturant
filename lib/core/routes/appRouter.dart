import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/features/order/presentation/pages/order_with_meal_id.dart';
import '../../features/auth/presentation/pages/login&signup.dart';
import '../../features/branch/data/models/branch_model.dart';
import '../../features/branch/domain/entities/branch_entity.dart';
import '../../features/branch/presentation/cubit/branch_cubit.dart';
import '../../features/branch/presentation/pages/branchSelection.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/presentation/pages/cart.dart';
import '../../features/developers/presentation/developers.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../config/animations/loading.dart';
import '../../features/privacy/pages/privacy.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login_signup',
    routes: [
      GoRoute(
        path: '/login_signup',
        builder: (context, state) => Login_SignupPage(),
      ),
      GoRoute(
        path: '/branch_selection',
        builder: (context, state) => const BranchSelectionPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          BranchEntity? branch;

          final extra = state.extra;

          if (extra is BranchEntity) {
            branch = extra;
          } else if (extra is Map<String, dynamic>) {
            branch = BranchModel.fromJson(extra);
          }

          return Home(selectedBranch: branch);
        },
      ),
      GoRoute(
        path: '/LoadinDount',
        builder: (context, state) => const LoadinDount(),
      ),
      GoRoute(
        path: '/Privacy',
        builder: (context,state) => const Privacy(),
      ),
      GoRoute(
        path: '/developers',
        builder: (context, state) => const Developers(),
      ),
      GoRoute(
        path: '/order',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          if (args == null || args['mealId'] == null) {
            return const Scaffold(
              body: Center(
                child: Text('خطأ: لم يتم العثور على معرف الوجبة'),
              ),
            );
          }
          return OrderWithMealId(mealId: args['mealId']);
        },
      ),
      GoRoute(
        path: '/card',
        builder: (context,state) {
          final branchState = context.read<BranchCubit>().state;
          int? branchId;
          if (branchState is BranchSelected) {
            branchId = branchState.branch.id;
          }

          if (branchId != null) {
            return BlocProvider.value(
              value: context.read<CartCubit>()..fetchCartInfo(branch_id: branchId),
              child: Cart(branch_id: branchId),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('يرجى اختيار فرع أولاً'),
              ),
            );
          }
        },
      ),
    ],
  );
}