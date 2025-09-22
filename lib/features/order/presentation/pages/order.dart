import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/widgets/CustomCart.dart';
import '../../domain/entities/meal_with_types_entity.dart';
import '../cubit/order_cubit.dart';
import '../widgets/CustomOrder.dart';
 

class Order extends StatelessWidget {
  final MealWithTypesEntity meal;

  const Order({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderCubit>(
      create: (_) => OrderCubit(meal),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, orderState) {
          final orderCubit = context.read<OrderCubit>();
          final List<String> subTypes = orderCubit.allSubTypes;
          final bool hasSubTypes = subTypes.isNotEmpty;

          final typesToShow = hasSubTypes
              ? subTypes
              : meal.types?.map((e) => e.name).toList() ?? [];

          final selectedTypeToShow =
          hasSubTypes ? orderState.selectedSubType : orderState.selectedType;

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomOrder(
                name: meal.name,
                description: meal.description,
                image: meal.image,
                type: typesToShow,
                selectedType: selectedTypeToShow,
                quantity: orderState.quantity,
                totalPrice: orderState.totalPrice,
                unitPrice: orderState.unitPrice,
                onIncrease: orderCubit.increase,
                onDecrease: orderCubit.decrease,
                onSelectType: hasSubTypes
                    ? orderCubit.selectSubType
                    : orderCubit.selectType,
                onAddToCart: () {
                  if (!orderState.isAvailable) return;

                  final cart = context.read<CartCubit>();
                  cart.addItem(
                    CartItem(
                      id: meal.id,
                      name: meal.name,
                      type: selectedTypeToShow ?? '',
                      image: meal.image,
                      quantity: orderState.quantity,
                      unitPrice: orderState.unitPrice,
                    ),
                  );

                  Navigator.of(context).pop();
                },
                isAvailable: orderState.isAvailable,
                subTypes: subTypes,
                selectedSubType: orderState.selectedSubType,
                onSelectSubType: orderCubit.selectSubType,
                supportAvailable: orderCubit.supportAvailable,
                isSupportedAdded: orderState.isSupportedAdded,
                onToggleSupport: orderCubit.toggleSupport,
              ),
            ),
          );
        },
      ),
    );
  }
}


// class Order extends StatelessWidget {
//   final int mealId;
//
//   const Order({super.key, required this.mealId});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<MealTypesCubit>(
//       create: (_) => di.sl<MealTypesCubit>()..getMealsTypes(mealId),
//       child: BlocBuilder<MealTypesCubit, MealTypesState>(
//         builder: (context, mealTypesState) {
//           if (mealTypesState is MealTypesLoading) {
//             return const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//
//           if (mealTypesState is MealTypesFailure) {
//             return Scaffold(
//               body: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.error_outline, size: 64, color: Colors.red),
//                     const SizedBox(height: 16),
//                     Text(
//                       'خطأ في تحميل البيانات',
//                       style: Theme.of(context).textTheme.headlineSmall,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       mealTypesState.message,
//                       style: Theme.of(context).textTheme.bodyMedium,
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         context.read<MealTypesCubit>().getMealsTypes(mealId);
//                       },
//                       child: const Text('إعادة المحاولة'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//
//           if (mealTypesState is MealTypesSuccess) {
//             final meal = mealTypesState.meals;
//
//             // Create OrderCubit after we have meal data
//             return BlocProvider<OrderCubit>(
//               create: (_) => OrderCubit(meal),
//               child: BlocBuilder<OrderCubit, OrderState>(
//                 builder: (context, orderState) {
//                   final orderCubit = context.read<OrderCubit>();
//                   final List<String> subTypes = orderCubit.allSubTypes;
//                   final bool hasSubTypes = subTypes.isNotEmpty;
//
//                   final typesToShow =
//                   hasSubTypes ? subTypes : meal.types?.map((e) => e.name).toList() ?? [];
//
//                   final selectedTypeToShow =
//                   hasSubTypes ? orderState.selectedSubType : orderState.selectedType;
//
//                   return Scaffold(
//                     backgroundColor: Colors.transparent,
//                     body: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: CustomOrder(
//                         name: meal.name,
//                         image: meal.image,
//                         type: typesToShow,
//                         selectedType: selectedTypeToShow,
//                         quantity: orderState.quantity,
//                         totalPrice: orderState.totalPrice,
//                         unitPrice: orderState.unitPrice,
//                         isSupportedAdded: orderState.isSupportedAdded,
//                         onIncrease: orderCubit.increase,
//                         onDecrease: orderCubit.decrease,
//                         onSelectType: hasSubTypes ? orderCubit.selectSubType : orderCubit.selectType,
//                         onToggleSupport: orderCubit.toggleSupport,
//                         onAddToCart: () {
//                           if (!orderState.isAvailable) return;
//
//                           final cart = context.read<CartCubit>();
//                           cart.addItem(CartItem(
//                             id: meal.id,
//                             name: meal.name,
//                             type: selectedTypeToShow ?? '',
//                             image: meal.image,
//                             quantity: orderState.quantity,
//                             unitPrice: orderState.unitPrice +
//                                 (orderState.isSupportedAdded ? 30 : 0),
//                           ));
//
//                           Navigator.of(context).pop();
//                         },
//                         isAvailable: orderState.isAvailable,
//                         subTypes: subTypes,
//                         selectedSubType: orderState.selectedSubType,
//                         onSelectSubType: orderCubit.selectSubType,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           }
//
//           return const Scaffold(
//             body: Center(child: Text('حالة غير معروفة')),
//           );
//         },
//       ),
//     );
//   }
// }

// class Order extends StatelessWidget {
//   final int mealId;
//
//   const Order({
//     super.key,
//     required this.mealId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<MealTypesCubit>(
//           create: (_) => di.sl<MealTypesCubit>()..getMealsTypes(mealId),
//         ),
//         BlocProvider<OrderCubit>(
//           create: (_) => OrderCubit(),
//         ),
//       ],
//       child: BlocBuilder<MealTypesCubit, MealTypesState>(
//         builder: (context, mealTypesState) {
//           if (mealTypesState is MealTypesLoading) {
//             return const Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//
//           if (mealTypesState is MealTypesFailure) {
//             return Scaffold(
//               body: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.error_outline,
//                       size: 64,
//                       color: Colors.red,
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       'خطأ في تحميل البيانات',
//                       style: Theme.of(context).textTheme.headlineSmall,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       mealTypesState.message,
//                       style: Theme.of(context).textTheme.bodyMedium,
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         context.read<MealTypesCubit>().getMealsTypes(mealId);
//                       },
//                       child: const Text('إعادة المحاولة'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//
//           if (mealTypesState is MealTypesSuccess) {
//             return BlocBuilder<OrderCubit, OrderState>(
//               builder: (context, orderState) {
//                 final orderCubit = context.read<OrderCubit>();
//                 final meal = mealTypesState.meals;
//
//                 // تحديث OrderCubit بالبيانات الجديدة
//                 if (orderState.meal.id != meal.id) {
//                   orderCubit.updateMeal(meal);
//                 }
//
//                 final List<String> subTypes = orderCubit.allSubTypes;
//                 final bool hasSubTypes = subTypes.isNotEmpty;
//
//                 final typesToShow = hasSubTypes ? subTypes : meal.types?.map((e) => e.name).toList() ?? [];
//
//                 final selectedTypeToShow = hasSubTypes ? orderState.selectedSubType : orderState.selectedType;
//
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CustomOrder(
//                     name: meal.name,
//                     image: meal.image,
//                     type: typesToShow,
//                     selectedType: selectedTypeToShow,
//                     quantity: orderState.quantity,
//                     totalPrice: orderState.totalPrice,
//                     unitPrice: orderState.unitPrice,
//                     isSupportedAdded: orderState.isSupportedAdded,
//                     onIncrease: orderCubit.increase,
//                     onDecrease: orderCubit.decrease,
//                     onSelectType: hasSubTypes ? orderCubit.selectSubType : orderCubit.selectType,
//                     onToggleSupport: orderCubit.toggleSupport,
//                     onAddToCart: () {
//                       if (!orderState.isAvailable) return;
//
//                       final cart = context.read<CartCubit>();
//                       cart.addItem(CartItem(
//                         id: meal.id,
//                         name: meal.name,
//                         type: selectedTypeToShow ?? '',
//                         image: meal.image,
//                         quantity: orderState.quantity,
//                         unitPrice: orderState.unitPrice + (orderState.isSupportedAdded ? 30 : 0),
//                       ));
//
//                       Navigator.of(context).pop();
//                     },
//                     isAvailable: orderState.isAvailable,
//                     subTypes: subTypes,
//                     selectedSubType: orderState.selectedSubType,
//                     onSelectSubType: orderCubit.selectSubType,
//                   ),
//                 );
//               },
//             );
//           }
//
//           return const Scaffold(
//             body: Center(
//               child: Text('حالة غير معروفة'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
