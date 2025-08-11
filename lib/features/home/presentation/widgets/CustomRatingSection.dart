import 'package:flutter/material.dart';
import 'package:web_app/core/constants/app_images.dart';
import '../../../../config/ResponsiveUI/responsiveConfig.dart';
import '../../../../core/constants/app_colors.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);

    double logoHeight;
    double logoWidth;

    if (responsive.isDesktop) {
      logoHeight = 250;
      logoWidth = 250;
    } else if (responsive.isTablet) {
      logoHeight = 250;
      logoWidth = 250;
    } else {
      logoHeight = 250;
      logoWidth = 250;
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: responsive.isDesktop ? 30 : responsive.isTablet ? 40 : 50),
          Image.asset(
            AppImages.logo,
            height: logoHeight,
            width: logoWidth,
          ),
          const SizedBox(height: 30),

          // خط التدرج الأول
          Container(
            width: 230,
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.amber.withOpacity(0),
                  AppColors.amber,
                  AppColors.amber.withOpacity(0),
                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  Icons.star,
                  color: AppColors.amber,
                  size: index == 2 ? 35 : 30,
                ),
              );
            }),
          ),

          // خط التدرج الثاني
          Container(
            width: 230,
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.amber.withOpacity(0),
                  AppColors.amber,
                  AppColors.amber.withOpacity(0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
