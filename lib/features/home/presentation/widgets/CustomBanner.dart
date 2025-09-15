import 'package:flutter/material.dart';
import '../../../../config/ResponsiveUI/responsiveConfig.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/networks/api_constant.dart';
import '../../../branch/domain/entities/branch_entity.dart';
import '../../../branch/presentation/cubit/branch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CustomRatingSection.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

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

    final branchState = context.watch<BranchCubit>().state;
    BranchEntity? selectedBranch;
    if (branchState is BranchSelected) {
      selectedBranch = branchState.branch;
      debugPrint("Selected Branch Name: ${selectedBranch.branch_name}");
    }

    final imageUrl = (selectedBranch?.image != null &&
        selectedBranch!.image!.isNotEmpty)
        ? '${ApiConstant.imageBase}/${selectedBranch.image!}'
        : null;

    return Center(
      child: SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            imageUrl != null
                ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AppImages.home,
                  fit: BoxFit.cover,
                );
              },
            )
                : Image.asset(
              AppImages.home,
              fit: BoxFit.cover,
            ),
            const Align(
              alignment: Alignment.center,
              child: RatingSection(),
            ),
          ],
        ),
      ),
    );
  }
}
