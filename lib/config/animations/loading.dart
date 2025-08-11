import 'package:flutter/material.dart';
import 'package:web_app/core/constants/app_images.dart';

class LoadinDount extends StatelessWidget {
  const LoadinDount({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
      onEnd: () {},
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 2 * 3.1415926,
          child: child,
        );
      },
      child: Image.asset(
        AppImages.donut,
        width: 60,
        height: 60,
      ),
    );
  }
}