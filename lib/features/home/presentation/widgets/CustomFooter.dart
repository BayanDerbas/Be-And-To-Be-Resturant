import 'package:flutter/material.dart';
import 'package:web_app/core/constants/app_colors.dart';
import 'package:web_app/core/constants/app_images.dart';
import '../../../../config/ResponsiveUI/responsiveConfig.dart';

class CustomFooter extends StatelessWidget {
  final List<String> phoneNumbers;
  final String logoAsset;
  final String facebookUrl;
  final String instagramUrl;
  final String mapsUrl;
  final String privacyPolicyText;
  final VoidCallback onPrivacyPolicyTap;
  final void Function(String url) onSocialTap;

  const CustomFooter({
    super.key,
    required this.phoneNumbers,
    required this.logoAsset,
    required this.facebookUrl,
    required this.instagramUrl,
    required this.mapsUrl,
    required this.privacyPolicyText,
    required this.onPrivacyPolicyTap,
    required this.onSocialTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);

    double maxContentWidth;
    if (responsive.isDesktop) {
      maxContentWidth = 1000;
    } else if (responsive.isTablet) {
      maxContentWidth = 800;
    } else {
      maxContentWidth = double.infinity;
    }

    return Container(
      width: maxContentWidth,
      decoration: BoxDecoration(
        color: AppColors.smooky2,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: -50,
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: AppColors.smooky2,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.6),
                                      blurRadius: 10,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: -40,
                              child: Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: AppColors.smooky2,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.6),
                                      blurRadius: 10,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: -50,
                              child: Image.asset(
                                logoAsset,
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: phoneNumbers
                            .map(
                              (number) => Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.phone, color: AppColors.white),
                                const SizedBox(width: 8),
                                Text(
                                  number,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialIcon(
                            iconAsset: AppImages.google_map,
                            onTap: () => onSocialTap(mapsUrl),
                          ),
                          _SocialIcon(
                            iconAsset: AppImages.instagram,
                            onTap: () => onSocialTap(instagramUrl),
                          ),
                          _SocialIcon(
                            iconAsset: AppImages.facebook,
                            onTap: () => onSocialTap(facebookUrl),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: onPrivacyPolicyTap,
                        child: Text(
                          privacyPolicyText,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Divider(
                    color: AppColors.orange,
                    thickness: 2,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onTap;

  const _SocialIcon({required this.iconAsset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(iconAsset, width: 50),
      onPressed: onTap,
    );
  }
}
