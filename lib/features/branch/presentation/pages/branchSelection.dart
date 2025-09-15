import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/CustomButton.dart';
import '../cubit/branch_cubit.dart';

class BranchSelectionPage extends StatelessWidget {
  const BranchSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BranchCubit>().fetchBranches();

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
                  return const CircularProgressIndicator(color: Colors.white);
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
                              log("success select branch ${branch.branch_name}");
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  );
                } else if (state is BranchesFailure) {
                  return Text(
                    state.message ?? 'خطأ غير معروف',
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
