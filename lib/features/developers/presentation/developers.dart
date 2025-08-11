import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants/app_colors.dart';

class Developers extends StatelessWidget {
  const Developers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ممكن تحدد الارتفاع حسب المحتوى أو حسب الشاشة
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.smooky2,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset("animations/Animation.json", width: 50, height: 50),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Icon(Icons.call, color: AppColors.orange),
                    SizedBox(width: 10),
                    Text("0932893893", style: TextStyle(color: AppColors.orange, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.call, color: AppColors.orange),
                    SizedBox(width: 10),
                    Text("0932893893", style: TextStyle(color: AppColors.orange, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.email, color: AppColors.orange),
                    SizedBox(width: 10),
                    Text("bayanderbas1@gmail.com", style: TextStyle(color: AppColors.orange, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.email, color: AppColors.orange),
                    SizedBox(width: 10),
                    Text("bayanderbas1@gmail.com", style: TextStyle(color: AppColors.orange, fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 12,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}