import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CustomProductCarousel extends StatelessWidget {
  final List<Map<String, String>> products;
  final int selectedIndex;
  final void Function(int index) onItemSelected;

  const CustomProductCarousel({
    super.key,
    required this.products,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double imageSize;
    double overlap;

    if (screenWidth < 600) {
      imageSize = 150.0;
      overlap = imageSize * 0.65;
    } else if (screenWidth < 1100) {
      imageSize = 150.0;
      overlap = imageSize * 0.55;
    } else {
      imageSize = 150.0;
      overlap = imageSize * 0.5;
    }

    final double centerPosition = (screenWidth / 2) - (imageSize / 2);

    List<Widget> stackItems = [];
    final otherIndices = List.generate(products.length, (i) => i)
      ..remove(selectedIndex);

    otherIndices.sort((a, b) {
      final distanceA = (a - selectedIndex).abs();
      final distanceB = (b - selectedIndex).abs();
      return distanceB.compareTo(distanceA);
    });

    for (int index in otherIndices) {
      final double itemPosition = centerPosition - (index - selectedIndex) * overlap;

      stackItems.add(
        AnimatedPositioned(
          key: ValueKey<int>(index),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: itemPosition,
          top: 20,
          child: GestureDetector(
            onTap: () => onItemSelected(index),
            child: ClipOval(
              child: AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  products[index]['image']!,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    }

    stackItems.add(
      AnimatedPositioned(
        key: ValueKey<int>(selectedIndex),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        left: centerPosition,
        top: 20,
        child: GestureDetector(
          onTap: () => onItemSelected(selectedIndex),
          child: Container(
            width: imageSize + 16,
            height: imageSize + 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.orange,
            ),
            alignment: Alignment.center,
            child: ClipOval(
              child: AnimatedScale(
                scale: 1.2,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  products[selectedIndex]['image']!,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: imageSize + 40,
            child: Center(
              child: ClipRect(
                child: OverflowBox(
                  maxWidth: double.infinity,
                  minWidth: 0,
                  maxHeight: imageSize + 40,
                  minHeight: imageSize + 40,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: screenWidth,
                    height: imageSize + 40,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: stackItems,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            products[selectedIndex]['name']!,
            style: const TextStyle(
              fontSize: 28,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}