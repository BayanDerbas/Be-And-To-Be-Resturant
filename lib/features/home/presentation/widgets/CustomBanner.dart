import 'package:flutter/material.dart';
import '../../../../config/ResponsiveUI/responsiveConfig.dart';
import '../../../../core/constants/app_images.dart';
import 'CustomRatingSection.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);
    double imageWidth =
        (responsive.isDesktop || responsive.isTablet)
            ? 1000
            : MediaQuery.of(context).size.width;
    double imageHeight = imageWidth / (16 / 9);

    if (!responsive.isDesktop && !responsive.isTablet && imageHeight < 300) {
      imageHeight = 500;
    }

    return Center(
      child: SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.home),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(child: RatingSection()),
        ),
      ),
    );
  }
}
