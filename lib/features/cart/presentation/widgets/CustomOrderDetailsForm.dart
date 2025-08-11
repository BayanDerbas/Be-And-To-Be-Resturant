import 'package:flutter/material.dart';
import '../../../../config/ResponsiveUI/responsiveConfig.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/CustomButton.dart';
import '../../../../core/widgets/CustomTextField.dart';

class CustomOrderDetailsForm extends StatelessWidget {
  final String title;
  final bool includeAddress;
  final bool includeTableNumber;
  final int totalPrice;
  final String? selectedCoupon;
  final List<String> availableCoupons;
  final ValueChanged<String> onSelectCoupon;
  final VoidCallback onSendOrder;
  final TextEditingController? addressController;
  final TextEditingController? noteController;
  final TextEditingController? tableNumberController;

  const CustomOrderDetailsForm({
    super.key,
    required this.title,
    required this.includeAddress,
    required this.includeTableNumber,
    required this.totalPrice,
    required this.selectedCoupon,
    required this.availableCoupons,
    required this.onSelectCoupon,
    required this.onSendOrder,
    this.addressController,
    this.noteController,
    this.tableNumberController,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);

    double fontSizeTitle = responsive.isMobile ? 18 : responsive.isTablet ? 20 : 22;
    double buttonHeight = responsive.isMobile ? 45 : 50;
    double buttonWidth = responsive.isMobile ? 140 : 140;
    double sectionPadding = responsive.isMobile ? 12 : 16;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(sectionPadding),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: fontSizeTitle,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16),

            if (includeTableNumber && tableNumberController != null)
              CustomTextField(
                hintText: 'رقم الطاولة',
                prefixIcon: Icons.table_bar,
                controller: tableNumberController!,
              ),

            if (includeAddress && addressController != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomTextField(
                  hintText: 'العنوان',
                  prefixIcon: Icons.place,
                  controller: addressController!,
                ),
              ),

            if (noteController != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomTextField(
                  hintText: 'ملاحظة',
                  prefixIcon: Icons.edit_note,
                  controller: noteController!,
                ),
              ),

            const SizedBox(height: 16),

            CustomButton(
              text: selectedCoupon ?? 'اختر الكوبون',
              onPressed: () => _showCouponDialog(context),
              buttonColor: AppColors.green,
              textColor: Colors.white,
              borderRadius: 10,
              height: buttonHeight,
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: AppColors.smooky2,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.watch_later_outlined, color: AppColors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        'وقت التحضير: 35 دقائق',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'السعر الإجمالي',
                              style: TextStyle(color: AppColors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'SYR $totalPrice',
                                style: const TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        text: 'إرسال الطلب',
                        onPressed: onSendOrder,
                        width: buttonWidth,
                        height: buttonHeight,
                        buttonColor: AppColors.orange,
                        textColor: Colors.white,
                        borderRadius: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCouponDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.smooky,
          title: const Text(
            'اختر الكوبون',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: availableCoupons.map((coupon) {
              return ListTile(
                title: Text(
                  coupon,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: AppColors.white),
                ),
                onTap: () => Navigator.pop(context, coupon),
              );
            }).toList(),
          ),
        );
      },
    );

    if (result != null) {
      onSelectCoupon(result);
    }
  }
}