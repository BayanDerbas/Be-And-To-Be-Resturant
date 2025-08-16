import 'package:flutter/material.dart';
import 'package:web_app/core/constants/app_colors.dart';
import 'package:web_app/config/ResponsiveUI/responsiveConfig.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2, right: 2),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: onTap ?? () => Navigator.of(context).pop(),
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(Icons.arrow_forward_ios, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
