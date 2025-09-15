import 'package:flutter/material.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ShopBannerWidget extends StatelessWidget {
  const ShopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(AppImagesPath.bannerImages),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fresh Vegetables',
            style: AppTypography.textFont22W600.copyWith(
              color: AppColorSchemes.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Get Up To 40% OFF',
            style: AppTypography.textFont16W500.copyWith(
              color: AppColorSchemes.white,
            ),
          ),
        ],
      ),
    );
  }
}
