import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../cubit/meal_types_cubit/meal_types_cubit.dart';
import 'order.dart';

class OrderWithMealId extends StatelessWidget {
  final int mealId;

  const OrderWithMealId({
    super.key,
    required this.mealId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MealTypesCubit>()..getMealsTypes(mealId),
      child: BlocBuilder<MealTypesCubit, MealTypesState>(
        builder: (context, state) {
          if (state is MealTypesLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          
          if (state is MealTypesFailure) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'خطأ في تحميل البيانات',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MealTypesCubit>().getMealsTypes(mealId);
                      },
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is MealTypesSuccess) {
            final meal = state.meals.first; // أو findById
            return Order(meal: meal);
          }

          
          return const Scaffold(
            body: Center(
              child: Text('حالة غير معروفة'),
            ),
          );
        },
      ),
    );
  }
}
