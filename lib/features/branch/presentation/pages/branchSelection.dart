import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/widgets/customButton.dart';
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
    context.read<BranchCubit>().fetchBranches();
  }

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: AppColors.smooky,
      body: SingleChildScrollView(
        child: Padding(
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
                  if (state is BranchLoaded) {
                    return Column(
                      children: state.branches.map((branch) {
                        return Column(
                          children: [
                            CustomButton(
                              borderRadius: 20,
                              width: 150,
                              text: branch.getName(langCode),
                              onPressed: () {
                                context.read<BranchCubit>().selectBranch(branch);
                                context.go('/home');
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }).toList(),
                    );
                  } else if (state is BranchInitial) {
                    return const CircularProgressIndicator();
                  } else {
                    return Text("فشل تحميل الافرع");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}