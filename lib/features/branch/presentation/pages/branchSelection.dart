import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../../core/widgets/CustomButton.dart';
import '../cubit/branch_cubit.dart';

class BranchSelectionPage extends StatefulWidget {
  const BranchSelectionPage({Key? key}) : super(key: key);

  @override
  State<BranchSelectionPage> createState() => _BranchSelectionPageState();
}

class _BranchSelectionPageState extends State<BranchSelectionPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndFetchBranches();
  }

  Future<void> _checkAuthAndFetchBranches() async {
    final token = await SecureStorage.getToken();

    if (token == null) {
      _showLoginDialog();
      return;
    }

    context.read<BranchCubit>().fetchBranches();
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: AppColors.smooky,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            "⚠️ تسجيل الدخول مطلوب",
            style: TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "الرجاء تسجيل الدخول أولاً للتمكن من اختيار الفرع",
            style: TextStyle(color: AppColors.white),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.pop();
                context.go('/login_signup');
              },
              child: Text(
                "تسجيل الدخول",
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.smooky,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.logo, width: 300)),
            const SizedBox(height: 50),
            Text(
              "اختيار فرع",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            BlocBuilder<BranchCubit, BranchState>(
              builder: (context, state) {
                if (state is BranchLoading || state is BranchInitial) {
                  return const CircularProgressIndicator(color: AppColors.orange);
                } else if (state is BranchSuccess) {
                  return Column(
                    children: state.branches.branches.map((branch) {
                      return Column(
                        children: [
                          CustomButton(
                            borderRadius: 20,
                            width: 150,
                            text: branch.branch_name ?? 'فرع بدون اسم',
                            onPressed: () {
                              context.read<BranchCubit>().selectBranch(branch);
                              context.go('/home', extra: branch);
                              log("✅ Branch selected: ${branch.branch_name}");
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  );
                } else if (state is BranchesFailure) {
                  return Text(
                    state.message ?? 'حدث خطأ أثناء جلب الفروع',
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
