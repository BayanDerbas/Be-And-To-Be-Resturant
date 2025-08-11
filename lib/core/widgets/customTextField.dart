import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color borderColor;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.borderColor = AppColors.white,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.grey),
          filled: true,
          fillColor: AppColors.smooky2,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: Icon(prefixIcon, color: AppColors.amber),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}