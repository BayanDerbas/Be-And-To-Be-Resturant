import 'package:flutter/material.dart';
import 'package:web_app/core/constants/app_colors.dart';
import 'package:web_app/core/constants/app_images.dart';
import '../../../../config/ResponsiveUI/responsiveConfig.dart';
import '../../../../core/networks/api_constant.dart';
import '../../../order/presentation/pages/order.dart';

class CustomListTypesProductList extends StatelessWidget {
  final List<Map<String, dynamic>> types;
  final double contentWidth;

  const CustomListTypesProductList({
    super.key,
    required this.types,
    required this.contentWidth,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);
    double fixedWidth;
    if (responsive.isDesktop) {
      fixedWidth = 1000;
    } else if (responsive.isTablet) {
      fixedWidth = 700;
    } else {
      fixedWidth = 500;
    }

    if (responsive.isMobile) {
      return Column(
        children: types.map((type) {
          final price = int.tryParse((type['price'] ?? '0').replaceAll('.', '')) ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: fixedWidth,
              child: CustomListTypesProduct(
                name: type['name'] ?? '',
                price: type['price'] ?? '0',
                image: type['image'] ?? '',
                width: fixedWidth,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      child: Order(
                        name: type['name'] ?? '',
                        image: type['image'] ?? '',
                        price: price,
                        types: [type],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
      );
    } else {
      return Center(
        child: SizedBox(
          width: fixedWidth,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: (fixedWidth / 2 - 32) / 100,
            ),
            itemCount: types.length,
            itemBuilder: (context, index) {
              final type = types[index];
              final price = int.tryParse((type['price'] ?? '0').replaceAll('.', '')) ?? 0;

              return CustomListTypesProduct(
                name: type['name'] ?? '',
                price: type['price'] ?? '0',
                image: type['image'] ?? '',
                width: fixedWidth / 2 - 32,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      child: Order(
                        name: type['name'] ?? '',
                        image: type['image'] ?? '',
                        price: price,
                        types: [type],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
    }
  }
}

class CustomListTypesProduct extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final double width;
  final VoidCallback onTap;

  const CustomListTypesProduct({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double itemHeight = 85;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: width,
          height: itemHeight,
          decoration: BoxDecoration(
            color: AppColors.smooky2,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.grey2, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 6,
                offset: const Offset(6, 6),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -20,
                right: 120,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      'SYR $price',
                      style: const TextStyle(
                        color: AppColors.black1,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 130),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -20,
                bottom: -20,
                right: -10,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: image.isNotEmpty
                          ? NetworkImage("${ApiConstant.imageBase}/$image")
                          : AssetImage(AppImages.pizza) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}