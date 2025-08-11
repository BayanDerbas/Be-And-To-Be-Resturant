import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CustomOrder extends StatelessWidget {
  final String name;
  final List<String> type;
  final String? selectedType;
  final List<String> subTypes;
  final String? selectedSubType;
  final String image;
  final int quantity;
  final int totalPrice;
  final int unitPrice;
  final bool isSupportedAdded;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleSupport;
  final Function(String) onSelectType;
  final Function(String) onSelectSubType;
  final bool isAvailable;

  const CustomOrder({
    super.key,
    required this.name,
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
    required this.isSupportedAdded,
    required this.onToggleSupport,
    required this.isAvailable,
    required this.subTypes,
    required this.selectedSubType,
    required this.onSelectSubType,
  });

  @override
  Widget build(BuildContext context) {
    final computedPrice = quantity * unitPrice + (isSupportedAdded ? 30 : 0);

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
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (!isAvailable)
                      Text(
                        "غير متاح",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
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
                        return ChoiceChip(
                          label: Text(
                            t,
                            style: const TextStyle(color: AppColors.white),
                          ),
                          selected: isSelected,
                          selectedColor: AppColors.orange,
                          backgroundColor: AppColors.black2,
                          checkmarkColor: AppColors.white,
                          onSelected: (_) => onSelectType(t),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Text(
                            "إضافات اختيارية",
                            style: TextStyle(color: AppColors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          ChoiceChip(
                            label: const Text(
                              "مدعومة",
                              style: TextStyle(color: AppColors.white),
                            ),
                            selected: isSupportedAdded,
                            selectedColor: AppColors.orange,
                            backgroundColor: AppColors.black2,
                            checkmarkColor: AppColors.white,
                            onSelected: (_) => onToggleSupport(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
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
                        backgroundColor:
                        isAvailable ? AppColors.orange : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: isAvailable ? AppColors.black1 : Colors.white,
                      ),
                      label: Text(
                        isAvailable ? "أضف إلى السلة" : "غير متاح",
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
