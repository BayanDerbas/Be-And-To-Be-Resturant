import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color? buttonColor;
  final Color? textColor;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.buttonColor,
    this.textColor,
    this.borderRadius = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? AppColors.black1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}