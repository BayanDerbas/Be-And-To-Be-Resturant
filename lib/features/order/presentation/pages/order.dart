import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/widgets/CustomCart.dart';
import '../../domain/entities/meal_with_types_entity.dart';
import '../cubit/order_cubit.dart';
import '../widgets/CustomOrder.dart';
import 'package:web_app/features/branch/presentation/cubit/branch_cubit.dart';


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
                onAddToCart: () async {
                  if (!orderState.isAvailable) return;

                  int typeId = 0;
                  if (meal.types != null && meal.types!.isNotEmpty) {
                    try {
                      final selectedType = meal.types!.firstWhere(
                        (t) => t.name == (selectedTypeToShow ?? ''),
                        orElse: () => meal.types!.first,
                      );
                      typeId = selectedType.id;
                    } catch (e) {
                      typeId = meal.types!.first.id;
                    }
                  }

                  int branchId = 0;
                  final branchState = context.read<BranchCubit>().state;
                  if (branchState is BranchSelected) {
                    branchId = branchState.branch.id;
                  }
                  final cartCubit = context.read<CartCubit>();
                  final cartItem = CartItem(
                    id: meal.id,
                    name: meal.name,
                    type: selectedTypeToShow ?? '',
                    image: meal.image,
                    quantity: orderState.quantity,
                    unitPrice: orderState.unitPrice,
                  );

                  await cartCubit.addToCartApi(
                    typeId: typeId,
                    amount: orderState.quantity,
                    price: orderState.totalPrice,
                    extra: orderState.isSupportedAdded ? 1 : 0,
                    branchId: branchId,
                    itemToAdd: cartItem,
                  );
                  cartCubit.stream.listen((cartState) {
                    if (cartState is CartSuccess) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(cartState.entity.messages.join(', '))),
                        );
                        context.pop();
                      }
                    } else if (cartState is CartError) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(cartState.message)),
                        );
                      }
                    }
                  });
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