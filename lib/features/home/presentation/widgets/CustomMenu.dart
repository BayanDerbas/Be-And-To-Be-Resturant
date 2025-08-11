import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../widgets/CustomMenuItem.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTabletOrDesktop = screenWidth >= 800;

    final List<Widget> menuItems = [];

    if (isTabletOrDesktop) {
      menuItems.add(const MenuItem(
        icon: Icon(Icons.icecream_outlined, size: 40, color: AppColors.white),
      ));

      menuItems.add(MenuItem(
        icon: Image.asset(
          AppImages.cup_drink,
          width: 30,
          height: 40,
          color: AppColors.white,
        ),
      ));
    }

    menuItems.add(const MenuItem(
      icon: Icon(Icons.local_cafe_outlined, size: 35, color: AppColors.white),
    ));

    if (isTabletOrDesktop) {
      menuItems.add(
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'قائمة الطعام',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    menuItems.addAll([
      const MenuItem(
        icon: Icon(Icons.wine_bar, size: 38, color: AppColors.white),
      ),
      MenuItem(
        icon: Image.asset(
          AppImages.restaurant,
          width: 38,
          height: 90,
          color: AppColors.white,
        ),
      ),
      const MenuItem(
        icon: Icon(Icons.local_pizza_outlined, size: 40, color: AppColors.white),
      ),
    ]);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: menuItems,
      ),
    );
  }
}