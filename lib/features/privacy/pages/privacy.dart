import 'package:flutter/material.dart';
import 'package:web_app/core/constants/app_colors.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 600,
              margin: const EdgeInsets.all(24),
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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "قائمة سياسة الخصوصية",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "نحن نحترم خصوصيتك وملتزمون بحماية البيانات الشخصية التي تقدمها لنا. "
                          "سيتم استخدام أي معلومات يتم جمعها فقط للأغراض المحددة مثل تحسين تجربتك داخل التطبيق.",
                      style: TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "• لن نقوم بمشاركة معلوماتك مع أي طرف ثالث بدون إذنك.\n"
                          "• يمكن للمستخدم طلب حذف بياناته في أي وقت.\n"
                          "• نحن نستخدم تقنيات الأمان لحماية بيانات المستخدم.",
                      style: TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                    const SizedBox(height: 24),
                    sectionTitle("حقوق المستخدم وحذف الحساب"),
                    sectionBody(
                      "يمكنك حذف حسابك في أي وقت، مما يؤدي إلى إزالة دائمة لبياناتك من نظامنا.\n"
                          "يرجى ملاحظة أن حذف الحساب لا يمكن عكسه، وعند الانتهاء، سيتم إزالة جميع البيانات والمعلومات المرتبطة بشكل دائم من نظامنا.",
                    ),
                    const SizedBox(height: 16),
                    sectionTitle("مشاركة البيانات"),
                    sectionBody(
                      "لا نبيع أو نشارك معلوماتك مع أطراف ثالثة، إلا لأغراض تشغيلية ضرورية.",
                    ),
                    const SizedBox(height: 16),
                    sectionTitle("اختيارات المستخدم والموافقة"),
                    sectionBody(
                      "لديك التحكم في المعلومات التي تقدمها ويمكنك الاختيار بعدم المشاركة في الاتصالات الترويجية.",
                    ),
                    const SizedBox(height: 16),
                    sectionTitle("تحديثات السياسة"),
                    sectionBody(
                      "قد نقوم بتعديل هذه السياسة وسنخطرك بالتغييرات الكبيرة.",
                    ),
                    const SizedBox(height: 16),
                    sectionTitle("معلومات الاتصال"),
                    sectionBody(
                      "للاستفسارات، يرجى الاتصال بنا على: bayanderbas1@gmail.com",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 42,
              right: 42,
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
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.orange,
      ),
    );
  }

  Widget sectionBody(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: AppColors.white,
        height: 1.5,
      ),
    );
  }
}