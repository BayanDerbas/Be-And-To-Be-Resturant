import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/networks/api_constant.dart';

class CustomOrder extends StatelessWidget {
  final String name;
  final String description;
  final List<String> type;
  final String? selectedType;
  final List<String> subTypes;
  final String? selectedSubType;
  final String image;
  final int quantity;
  final int totalPrice;
  final int unitPrice;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onAddToCart;
  final Function(String) onSelectType;
  final Function(String) onSelectSubType;
  final bool isAvailable;
  final bool supportAvailable;
  final bool isSupportedAdded;
  final VoidCallback onToggleSupport;

  const CustomOrder({
    super.key,
    required this.name,
    required this.description,
    required this.type,
    required this.image,
    required this.quantity,
    required this.totalPrice,
    required this.unitPrice,
    required this.onIncrease,
    required this.onDecrease,
    required this.onAddToCart,
    required this.onSelectType,
    required this.selectedType,
    required this.isAvailable,
    required this.subTypes,
    required this.selectedSubType,
    required this.onSelectSubType,
    required this.supportAvailable,
    required this.isSupportedAdded,
    required this.onToggleSupport,
  });

  @override
  Widget build(BuildContext context) {
    final computedPrice = quantity * unitPrice;

    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            width: 500,
            height: 650,
            decoration: BoxDecoration(
              color: AppColors.smooky,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('${ApiConstant.imageBase}/$image'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "النوع",
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: type.map((t) {
                        final isSelected = t == selectedType;
                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => onSelectType(t),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.orange : AppColors.black2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              t,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    if (supportAvailable) ...[
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "مدعومة",
                              style: TextStyle(color: AppColors.white, fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            Switch(
                              value: isSupportedAdded,
                              onChanged: (_) => onToggleSupport(),
                              activeColor: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: AppColors.orange),
                          onPressed: onDecrease,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "$quantity",
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.black1,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: AppColors.orange),
                          onPressed: onIncrease,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "SYR $computedPrice",
                          style: const TextStyle(
                            color: AppColors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: isAvailable ? AppColors.black1 : Colors.white,
                      ),
                      label: Text(
                        "أضف الى السلة",
                        style: TextStyle(
                          color: isAvailable ? AppColors.black1 : Colors.white,
                        ),
                      ),
                      onPressed: isAvailable ? onAddToCart : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 28,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
