import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieButton extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const CustomLottieButton({
    super.key,
    required this.assetPath,
    this.width = 60,
    this.height = 60,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Lottie.asset(
        assetPath,
        width: width,
        height: height,
        repeat: true,
      ),
    );
  }
}