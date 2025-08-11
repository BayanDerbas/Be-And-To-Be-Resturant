import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class CustomMenuTitle extends StatelessWidget {
  const CustomMenuTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.icecream_outlined, size: 35, color: AppColors.white),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 18),
          child: Text('قائمة الطعام', style: TextStyle(color: AppColors.white, fontSize: 23, fontWeight: FontWeight.bold)),
        ),
        SizedBox(width: 2,),
        Image.asset(AppImages.cup_drink, width: 30, height: 43),
      ],
    );
  }
}