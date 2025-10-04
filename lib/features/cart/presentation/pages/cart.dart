import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/core/constants/app_colors.dart';
import 'package:web_app/features/cart/presentation/widgets/CustomOrderDetailsForm.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/CustomCart.dart';

class Cart extends StatelessWidget {
  final int branch_id;
  const Cart({super.key, required this.branch_id});

  @override
  Widget build(BuildContext context) {
    // تحميل بيانات السلة مرة واحدة بعد بناء الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cartCubit = context.read<CartCubit>();
      if (cartCubit.state is! CartInfoSuccess &&
          cartCubit.state is! CartLoading) {
        cartCubit.fetchCartInfo(branch_id: branch_id);
      }
    });

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();

        // حالة التحميل
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // حالة الخطأ
        if (state is CartError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        // ✅ عرض التصميم سواء كانت الحالة CartInitial أو CartInfoSuccess
        if (state is CartInitial || state is CartInfoSuccess) {
          final cartState = state is CartInitial ? state : null;

          // في حالة CartInfoSuccess نجهز البيانات القادمة من الـ API
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

          final minOrderPrice = state is CartInitial
              ? state.minOrderPrice
              : 0; // مؤقتًا إلى أن تأتي من الـ API

          final selectedCoupon = state is CartInitial
              ? state.selectedCoupon
              : null;
          final coupons = state is CartInitial
              ? state.coupons
              : [];

          final tableController = TextEditingController(
              text: cartState?.tableNumber ?? '');
          final noteController =
          TextEditingController(text: cartState?.note ?? '');

          final screenWidth = MediaQuery.of(context).size.width;
          final containerWidth =
          screenWidth > 1000 ? 900.0 : screenWidth * 0.9;

          // 🧱 نفس الديزاين تمامًا بدون أي تعديل
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
                onIncreaseQuantity: cartCubit.increaseQuantity,
                onDecreaseQuantity: cartCubit.decreaseOrRemoveItem,
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
                                                padding:
                                                EdgeInsets.symmetric(
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
                                            print(
                                                "sending order with table: ${tableController.text} note: ${noteController.text}");
                                          },
                                          tableNumberController:
                                          tableController,
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
//   const Cart({super.key,required this.branch_id});
//
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final cartCubit = context.read<CartCubit>();
//       if (cartCubit.state is! CartInfoSuccess &&
//           cartCubit.state is! CartLoading) {
//         cartCubit.fetchCartInfo(branch_id: branch_id);
//       }
//     });
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         final cartCubit = context.read<CartCubit>()..fetchCartInfo(branch_id: branch_id);
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
//         if (state is CartInfoSuccess) {
//           final carts = state.entity;
//           if (carts.isEmpty) {
//             return const Center(
//               child: Text("السلة فارغة", style: TextStyle(color: Colors.white)),
//             );
//           }
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: carts.length,
//             itemBuilder: (context, index) {
//               final cart = carts[index];
//               return Card(
//                 color: AppColors.smooky,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ExpansionTile(
//                   title: Text(
//                     "سلة #${cart.id} - الإجمالي: ${cart.total_price}",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   children: cart.cartitems?.map((item) {
//                     return ListTile(
//                       leading: item.type?.meal?.image != null
//                           ? Image.network(
//                         "${ApiConstant.imageBase}/${item.type!.meal!.image ?? ""}",
//                         width: 40,
//                         height: 40,
//                         fit: BoxFit.cover,
//                       )
//                           : const Icon(
//                         Icons.fastfood,
//                         color: Colors.white,
//                       ),
//                       title: Text(
//                         item.type?.meal?.name ?? "وجبة",
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       subtitle: Text(
//                         "${item.type?.name ?? ''} | الكمية: ${item.amount} | السعر: ${item.type!.price}",
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     );
//                   }).toList() ??
//                       [],
//                 ),
//               );
//             },
//           );
//         }
//         if (state is CartInitial) {
//           final cartState = state;
//           final tableController =
//           TextEditingController(text: cartState.tableNumber ?? '');
//           final noteController =
//           TextEditingController(text: cartState.note ?? '');
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
//                 items: cartState.items,
//                 totalPrice: cartState.totalPrice,
//                 minOrderPrice: cartState.minOrderPrice,
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
//                       actionsPadding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
//                           child:
//                           const Text('نعم', style: TextStyle(color: Colors.white)),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.green,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           onPressed: () => Navigator.of(context).pop(),
//                           child:
//                           const Text('لا', style: TextStyle(color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 onIncreaseQuantity: cartCubit.increaseQuantity,
//                 onDecreaseQuantity: cartCubit.decreaseOrRemoveItem,
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
//                       actionsPadding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
//                           child:
//                           const Text('نعم', style: TextStyle(color: Colors.white)),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.green,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           onPressed: () => Navigator.of(context).pop(),
//                           child:
//                           const Text('لا', style: TextStyle(color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 onNext: () {
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
//                               return Column(
//                                 children: [
//                                   const SizedBox(height: 10),
//                                   ValueListenableBuilder(
//                                     valueListenable: tabController.animation!,
//                                     builder: (context, value, _) {
//                                       final labels = [
//                                         'إرسال إلى العنوان',
//                                         'استلام ذاتي',
//                                         'طلب على الطاولة',
//                                       ];
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
//                                                     fontSize: isSelected ? 16 : 14,
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
//                                           totalPrice: cartState.totalPrice,
//                                           selectedCoupon:
//                                           cartState.selectedCoupon,
//                                           availableCoupons: cartState.coupons,
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
//                                           totalPrice: cartState.totalPrice,
//                                           selectedCoupon:
//                                           cartState.selectedCoupon,
//                                           availableCoupons: cartState.coupons,
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
//                                           totalPrice: cartState.totalPrice,
//                                           selectedCoupon:
//                                           cartState.selectedCoupon,
//                                           availableCoupons: cartState.coupons,
//                                           onSelectCoupon:
//                                           cartCubit.selectCoupon,
//                                           onSendOrder: () {
//                                             cartCubit.updateNote(
//                                                 noteController.text);
//                                             cartCubit.updateTableNumber(
//                                                 tableController.text);
//                                             print(
//                                                 "sending order with table: ${tableController.text} note: ${noteController.text}");
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
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }