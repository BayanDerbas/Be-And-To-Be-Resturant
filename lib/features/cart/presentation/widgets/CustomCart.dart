import 'package:flutter/material.dart';
import 'package:web_app/core/constants/app_colors.dart';
import 'package:web_app/core/widgets/customBackButton.dart';

class Customcard extends StatelessWidget {
  final List<CartItem> items;
  final int totalPrice;
  final int minOrderPrice;
  final void Function(CartItem) onItemTap;
  final void Function(CartItem) onIncreaseQuantity;
  final void Function(CartItem) onDecreaseQuantity;
  final void Function(CartItem) onDeleteItem;
  final void Function() onNext;

  const Customcard({
    super.key,
    required this.items,
    required this.totalPrice,
    required this.minOrderPrice,
    required this.onItemTap,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
    required this.onDeleteItem,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'الطلب (${items.length})',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (items.isEmpty)
                    const Text(
                      'السلة فارغة',
                      style: TextStyle(color: AppColors.white),
                    )
                  else
                    ...items.map(
                          (item) => GestureDetector(
                        onTap: () => onItemTap(item),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.black2,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(item.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    const SizedBox(height: 6),
                                    if (item.type != null)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Text(
                                          item.type!,
                                          style: const TextStyle(
                                            color: AppColors.black1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${item.unitPrice} SYR',
                                          style: const TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: AppColors.orange,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () => onIncreaseQuantity(item),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: AppColors.black1,
                                                  size: 20,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                '${item.quantity}',
                                                style: const TextStyle(
                                                  color: AppColors.black1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              GestureDetector(
                                                onTap: () {
                                                  if (item.quantity > 1) {
                                                    onDecreaseQuantity(item);
                                                  } else {
                                                    onDeleteItem(item);
                                                  }
                                                },
                                                child: Icon(
                                                  item.quantity > 1 ? Icons.remove : Icons.delete,
                                                  color: item.quantity > 1 ? AppColors.black1 : Colors.red,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const Divider(color: AppColors.orange),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'السعر الإجمالي',
                        style: TextStyle(
                          color: totalPrice >= minOrderPrice
                              ? AppColors.orange
                              : AppColors.green_,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$totalPrice SYR',
                        style: const TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  if (totalPrice < minOrderPrice)
                    Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'الحد الأدنى لسعر الطلب: $minOrderPrice SYR',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ElevatedButton(
                    onPressed: totalPrice >= minOrderPrice ? onNext : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'التالي',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        CustomBackButton(),
      ]
    );
  }
}

class CartItem {
  final String name;
  final String? type;
  final String image;
  final int quantity;
  final int unitPrice;

  CartItem({
    required this.name,
    this.type,
    required this.image,
    required this.quantity,
    required this.unitPrice,
  });
}