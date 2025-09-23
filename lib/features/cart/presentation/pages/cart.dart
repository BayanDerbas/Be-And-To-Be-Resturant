import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/core/constants/app_colors.dart';
import 'package:web_app/features/cart/presentation/widgets/CustomOrderDetailsForm.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/CustomCart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        
        // Handle different cart states
        if (state is! CartInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final cartState = state;
        final tableController = TextEditingController(
          text: cartState.tableNumber ?? '',
        );
        final noteController = TextEditingController(text: cartState.note ?? '');

        final screenWidth = MediaQuery.of(context).size.width;
        final containerWidth = screenWidth > 1000 ? 900.0 : screenWidth * 0.9;

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
              items: cartState.items,
              totalPrice: cartState.totalPrice,
              minOrderPrice: cartState.minOrderPrice,
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
                    actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          cartCubit.removeItem(item);
                        },
                        child: const Text('نعم', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('لا', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              },
              onIncreaseQuantity: (item) {
                cartCubit.increaseQuantity(item);
              },
              onDecreaseQuantity: (item) {
                cartCubit.decreaseOrRemoveItem(item);
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
                    actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          cartCubit.removeItem(item);
                        },
                        child: const Text('نعم', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('لا', style: TextStyle(color: Colors.white)),
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

                            return Column(
                              children: [
                                SizedBox(height: 10),
                                ValueListenableBuilder(
                                  valueListenable: tabController.animation!,
                                  builder: (context, value, _) {
                                    return Row(
                                      children: List.generate(3, (index) {
                                        final isSelected =
                                            tabController.index == index;
                                        final labels = [
                                          'إرسال إلى العنوان',
                                          'استلام ذاتي',
                                          'طلب على الطاولة',
                                        ];
                                        return Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              tabController.animateTo(index);
                                            },
                                            child: AnimatedContainer(
                                              duration:
                                              Duration(milliseconds: 300),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: isSelected ? 10 : 5,
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
                                                  fontSize: isSelected ? 16 : 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow:
                                                TextOverflow.ellipsis, // truncate if too long
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
                                        totalPrice: cartState.totalPrice,
                                        selectedCoupon: cartState.selectedCoupon,
                                        availableCoupons: cartState.coupons,
                                        onSelectCoupon: (coupon) {
                                          cartCubit.selectCoupon(coupon);
                                        },
                                        onSendOrder: () {
                                          cartCubit.updateNote(noteController.text);
                                        },
                                        addressController: TextEditingController(),
                                        noteController: noteController,
                                      ),
                                      CustomOrderDetailsForm(
                                        title: 'طلب استلام ذاتي',
                                        includeAddress: false,
                                        includeTableNumber: false,
                                        totalPrice: cartState.totalPrice,
                                        selectedCoupon: cartState.selectedCoupon,
                                        availableCoupons: cartState.coupons,
                                        onSelectCoupon: (coupon) {
                                          cartCubit.selectCoupon(coupon);
                                        },
                                        onSendOrder: () {
                                          cartCubit.updateNote(noteController.text);
                                        },
                                        noteController: noteController,
                                      ),
                                      CustomOrderDetailsForm(
                                        title: 'طلب على الطاولة',
                                        includeAddress: false,
                                        includeTableNumber: true,
                                        totalPrice: cartState.totalPrice,
                                        selectedCoupon: cartState.selectedCoupon,
                                        availableCoupons: cartState.coupons,
                                        onSelectCoupon: (coupon) {
                                          cartCubit.selectCoupon(coupon);
                                        },
                                        onSendOrder: () {
                                          cartCubit.updateNote(noteController.text);
                                          cartCubit.updateTableNumber(tableController.text);
                                          print(
                                            "sending order with table: ${tableController.text} note: ${noteController.text}",
                                          );
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
      },
    );
  }
}
