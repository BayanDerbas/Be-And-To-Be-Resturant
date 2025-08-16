import 'package:flutter/material.dart';
import '../../../../config/ResponsiveUI/responsiveConfig.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/networks/api_constant.dart';
import '../../../branch/domain/entities/branch_entity.dart';
import 'CustomRatingSection.dart';

class CustomBanner extends StatelessWidget {
  final BranchEntity? branch;
  const CustomBanner({super.key, this.branch});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);
    double imageWidth = (responsive.isDesktop || responsive.isTablet)
        ? 1000
        : MediaQuery.of(context).size.width;
    double imageHeight = imageWidth / (16 / 9);

    if (!responsive.isDesktop && !responsive.isTablet && imageHeight < 300) {
      imageHeight = 500;
    }

    // // Default to local asset
    // ImageProvider imageProvider = AssetImage(AppImages.home);
    //
    // // Use branch image if available
    // if (branch != null && branch!.image != null && branch!.image!.isNotEmpty) {
    //   final fullImageUrl =
    //       '${ApiConstant.imageBase}storage/${branch!.image!}';
    //   imageProvider = NetworkImage(fullImageUrl);
    // }

    return Center(
      child: SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.home),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), // درجة البهتان
                BlendMode.darken, // نوع الدمج
              ),
              // onError: (exception, stackTrace) {
              //   // If the network image fails, replace with local asset
              //   imageProvider = AssetImage(AppImages.home);
              // },
            ),
          ),
          child: const Center(child: RatingSection()),
        ),
      ),
    );
  }
}
