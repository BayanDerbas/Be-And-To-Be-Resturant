import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/config/animations/loading.dart';
import 'package:web_app/core/constants/app_colors.dart';
import 'package:web_app/features/cart/presentation/widgets/CustomOrderDetailsForm.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/CustomCart.dart';
import '../cubit/update_count_cart_cubit.dart';

class Cart extends StatelessWidget {
  final int branch_id;
  const Cart({super.key, required this.branch_id});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cartCubit = context.read<CartCubit>();
      cartCubit.fetchCartInfo(branch_id: branch_id);
    });

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        final updateCountCubit = context.read<UpdateCountCartCubit>();

        if (state is CartLoading) {
          return const Center(child: LoadinDount());
        }
        if (state is CartError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is CartInitial || state is CartInfoSuccess) {
          final cartState = state is CartInitial ? state : null;

          final items = state is CartInitial
              ? state.items
              : (state as CartInfoSuccess)
              .entity
              .first
              .cartitems
              ?.map(
                (item) => CartItem(
              id: item.id ?? 0,
              name: item.type?.meal?.name ?? "غير معروف",
              type: item.type?.name ?? "",
              image: item.type?.meal?.image ?? "",
              quantity: item.amount ?? 1,
              unitPrice: item.type?.price ?? 0,
            ),
          )
              .toList() ??
              [];

          final totalPrice = state is CartInitial
              ? state.totalPrice
              : (state as CartInfoSuccess).entity.first.total_price ?? 0;

          final minOrderPrice = state is CartInitial ? state.minOrderPrice : 0;

          final selectedCoupon =
          state is CartInitial ? state.selectedCoupon : null;
          final coupons = state is CartInitial ? state.coupons : [];

          final tableController =
          TextEditingController(text: cartState?.tableNumber ?? '');
          final noteController =
          TextEditingController(text: cartState?.note ?? '');

          final screenWidth = MediaQuery.of(context).size.width;
          final containerWidth =
          screenWidth > 1000 ? 900.0 : screenWidth * 0.9;

          return Center(
            child: Container(
              width: containerWidth,
              height: 500,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.smooky,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Customcard(
                items: items,
                totalPrice: totalPrice,
                minOrderPrice: minOrderPrice,
                onItemTap: (item) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: AppColors.smooky,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(
                        '؟ حذف ${item.name}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actionsPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            cartCubit.removeItem(item);
                          },
                          child: const Text('نعم',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('لا',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },

                onIncreaseQuantity: (item) async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => Center(child: const LoadinDount()),
                  );
                  await updateCountCubit.addOne(item.id);
                  Navigator.of(context).pop();
                  cartCubit.fetchCartInfo(branch_id: branch_id);
                },

                onDecreaseQuantity: (item) async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => Center(child: const LoadinDount()),
                  );
                  await updateCountCubit.minusOne(item.id);
                  Navigator.of(context).pop();
                  cartCubit.fetchCartInfo(branch_id: branch_id);
                },

                onDeleteItem: (item) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: AppColors.smooky,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(
                        'هل أنت متأكد من حذف ${item.name}?',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actionsPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            cartCubit.removeItem(item);
                          },
                          child: const Text('نعم',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('لا',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },

                onNext: () {
                  // Keep design same
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        width: 1000,
                        height: 500,
                        decoration: BoxDecoration(
                          color: AppColors.smooky,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DefaultTabController(
                          length: 3,
                          child: Builder(
                            builder: (context) {
                              final TabController tabController =
                              DefaultTabController.of(context);

                              final labels = [
                                'إرسال إلى العنوان',
                                'استلام ذاتي',
                                'طلب على الطاولة',
                              ];

                              return Column(
                                children: [
                                  const SizedBox(height: 10),
                                  ValueListenableBuilder(
                                    valueListenable: tabController.animation!,
                                    builder: (context, value, _) {
                                      return Row(
                                        children: List.generate(3, (index) {
                                          final isSelected =
                                              tabController.index == index;
                                          return Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                tabController.animateTo(index);
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                  isSelected ? 10 : 5,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? AppColors.orange
                                                      : Colors.transparent,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  labels[index],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.grey,
                                                    fontSize:
                                                    isSelected ? 16 : 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        CustomOrderDetailsForm(
                                          title: 'طلب إرسال إلى عنوان',
                                          includeAddress: true,
                                          includeTableNumber: false,
                                          totalPrice: totalPrice,
                                          selectedCoupon: selectedCoupon,
                                          availableCoupons: ["jijh"],
                                          onSelectCoupon:
                                          cartCubit.selectCoupon,
                                          onSendOrder: () {
                                            cartCubit.updateNote(
                                                noteController.text);
                                          },
                                          addressController:
                                          TextEditingController(),
                                          noteController: noteController,
                                        ),
                                        CustomOrderDetailsForm(
                                          title: 'طلب استلام ذاتي',
                                          includeAddress: false,
                                          includeTableNumber: false,
                                          totalPrice: totalPrice,
                                          selectedCoupon: selectedCoupon,
                                          availableCoupons: ["gygyugf"],
                                          onSelectCoupon:
                                          cartCubit.selectCoupon,
                                          onSendOrder: () {
                                            cartCubit.updateNote(
                                                noteController.text);
                                          },
                                          noteController: noteController,
                                        ),
                                        CustomOrderDetailsForm(
                                          title: 'طلب على الطاولة',
                                          includeAddress: false,
                                          includeTableNumber: true,
                                          totalPrice: totalPrice,
                                          selectedCoupon: selectedCoupon,
                                          availableCoupons: ["uiuiuh"],
                                          onSelectCoupon:
                                          cartCubit.selectCoupon,
                                          onSendOrder: () {
                                            cartCubit.updateNote(
                                                noteController.text);
                                            cartCubit.updateTableNumber(
                                                tableController.text);
                                          },
                                          tableNumberController: tableController,
                                          noteController: noteController,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

// class Cart extends StatelessWidget {
//   final int branch_id;
//   const Cart({super.key, required this.branch_id});
//
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final cartCubit = context.read<CartCubit>();
//       cartCubit.fetchCartInfo(branch_id: branch_id);
//     });
//
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         final cartCubit = context.read<CartCubit>();
//         final updateCountCubit = context.read<UpdateCountCartCubit>();
//
//         if (state is CartLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (state is CartError) {
//           return Center(
//             child: Text(
//               state.message,
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         }
//
//         if (state is CartInitial || state is CartInfoSuccess) {
//           final cartState = state is CartInitial ? state : null;
//
//           final items = state is CartInitial
//               ? state.items
//               : (state as CartInfoSuccess)
//               .entity
//               .first
//               .cartitems
//               ?.map(
//                 (item) => CartItem(
//               id: item.id ?? 0,
//               name: item.type?.meal?.name ?? "غير معروف",
//               type: item.type?.name ?? "",
//               image: item.type?.meal?.image ?? "",
//               quantity: item.amount ?? 1,
//               unitPrice: item.type?.price ?? 0,
//             ),
//           )
//               .toList() ??
//               [];
//
//           final totalPrice = state is CartInitial
//               ? state.totalPrice
//               : (state as CartInfoSuccess).entity.first.total_price ?? 0;
//
//           final minOrderPrice = state is CartInitial ? state.minOrderPrice : 0;
//
//           final selectedCoupon =
//           state is CartInitial ? state.selectedCoupon : null;
//           final coupons = state is CartInitial ? state.coupons : [];
//
//           final tableController =
//           TextEditingController(text: cartState?.tableNumber ?? '');
//           final noteController =
//           TextEditingController(text: cartState?.note ?? '');
//
//           final screenWidth = MediaQuery.of(context).size.width;
//           final containerWidth =
//           screenWidth > 1000 ? 900.0 : screenWidth * 0.9;
//
//           return Center(
//             child: Container(
//               width: containerWidth,
//               height: 500,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: AppColors.smooky,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Customcard(
//                 items: items,
//                 totalPrice: totalPrice,
//                 minOrderPrice: minOrderPrice,
//                 onItemTap: (item) {
//                   showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       backgroundColor: AppColors.smooky,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       title: Text(
//                         '؟ حذف ${item.name}',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       actionsAlignment: MainAxisAlignment.spaceBetween,
//                       actionsPadding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 8),
//                       actions: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                             cartCubit.removeItem(item);
//                           },
//                           child: const Text('نعم',
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.green,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           onPressed: () => Navigator.of(context).pop(),
//                           child: const Text('لا',
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//
//                 // Updated increase quantity with API call
//                 onIncreaseQuantity: (item) async {
//                   await updateCountCubit.addOne(item.id);
//                   cartCubit.fetchCartInfo(branch_id: branch_id);
//                 },
//
//                 // Updated decrease quantity with API call
//                 onDecreaseQuantity: (item) async {
//                   await updateCountCubit.minusOne(item.id);
//                   cartCubit.fetchCartInfo(branch_id: branch_id);
//                 },
//
//                 onDeleteItem: (item) {
//                   showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       backgroundColor: AppColors.smooky,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       title: Text(
//                         'هل أنت متأكد من حذف ${item.name}?',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       actionsAlignment: MainAxisAlignment.spaceBetween,
//                       actionsPadding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 8),
//                       actions: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                             cartCubit.removeItem(item);
//                           },
//                           child: const Text('نعم',
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.green,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           onPressed: () => Navigator.of(context).pop(),
//                           child: const Text('لا',
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//
//                 onNext: () {
//                   // Keep design same
//                   showDialog(
//                     context: context,
//                     builder: (context) => Dialog(
//                       backgroundColor: Colors.transparent,
//                       child: Container(
//                         width: 1000,
//                         height: 500,
//                         decoration: BoxDecoration(
//                           color: AppColors.smooky,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: DefaultTabController(
//                           length: 3,
//                           child: Builder(
//                             builder: (context) {
//                               final TabController tabController =
//                               DefaultTabController.of(context);
//
//                               final labels = [
//                                 'إرسال إلى العنوان',
//                                 'استلام ذاتي',
//                                 'طلب على الطاولة',
//                               ];
//
//                               return Column(
//                                 children: [
//                                   const SizedBox(height: 10),
//                                   ValueListenableBuilder(
//                                     valueListenable: tabController.animation!,
//                                     builder: (context, value, _) {
//                                       return Row(
//                                         children: List.generate(3, (index) {
//                                           final isSelected =
//                                               tabController.index == index;
//                                           return Expanded(
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 tabController.animateTo(index);
//                                               },
//                                               child: AnimatedContainer(
//                                                 duration: const Duration(
//                                                     milliseconds: 300),
//                                                 padding: EdgeInsets.symmetric(
//                                                   horizontal: isSelected ? 10 : 5,
//                                                   vertical: 10,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   color: isSelected
//                                                       ? AppColors.orange
//                                                       : Colors.transparent,
//                                                   borderRadius:
//                                                   BorderRadius.circular(10),
//                                                 ),
//                                                 child: Text(
//                                                   labels[index],
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                     color: isSelected
//                                                         ? Colors.white
//                                                         : Colors.grey,
//                                                     fontSize:
//                                                     isSelected ? 16 : 14,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         }),
//                                       );
//                                     },
//                                   ),
//                                   const SizedBox(height: 10),
//                                   Expanded(
//                                     child: TabBarView(
//                                       children: [
//                                         CustomOrderDetailsForm(
//                                           title: 'طلب إرسال إلى عنوان',
//                                           includeAddress: true,
//                                           includeTableNumber: false,
//                                           totalPrice: totalPrice,
//                                           selectedCoupon: selectedCoupon,
//                                           availableCoupons: ["jijh"],
//                                           onSelectCoupon:
//                                           cartCubit.selectCoupon,
//                                           onSendOrder: () {
//                                             cartCubit.updateNote(
//                                                 noteController.text);
//                                           },
//                                           addressController:
//                                           TextEditingController(),
//                                           noteController: noteController,
//                                         ),
//                                         CustomOrderDetailsForm(
//                                           title: 'طلب استلام ذاتي',
//                                           includeAddress: false,
//                                           includeTableNumber: false,
//                                           totalPrice: totalPrice,
//                                           selectedCoupon: selectedCoupon,
//                                           availableCoupons: ["gygyugf"],
//                                           onSelectCoupon:
//                                           cartCubit.selectCoupon,
//                                           onSendOrder: () {
//                                             cartCubit.updateNote(
//                                                 noteController.text);
//                                           },
//                                           noteController: noteController,
//                                         ),
//                                         CustomOrderDetailsForm(
//                                           title: 'طلب على الطاولة',
//                                           includeAddress: false,
//                                           includeTableNumber: true,
//                                           totalPrice: totalPrice,
//                                           selectedCoupon: selectedCoupon,
//                                           availableCoupons: ["uiuiuh"],
//                                           onSelectCoupon:
//                                           cartCubit.selectCoupon,
//                                           onSendOrder: () {
//                                             cartCubit.updateNote(
//                                                 noteController.text);
//                                             cartCubit.updateTableNumber(
//                                                 tableController.text);
//                                           },
//                                           tableNumberController: tableController,
//                                           noteController: noteController,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         }
//
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
