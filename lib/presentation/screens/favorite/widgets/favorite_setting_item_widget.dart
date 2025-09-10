import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class FavoriteSettingItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  const FavoriteSettingItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColorSchemes.black.withAlpha(70)),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 30,
          left: 32,
          bottom: 30,
          right: 26,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: width ?? 50,
              height: height ?? 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTypography.textFont16W600.copyWith(
                      color: AppColorSchemes.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTypography.textFont14W500.copyWith(
                      color: AppColorSchemes.grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: AppTypography.textFont16W600.copyWith(
                    color: AppColorSchemes.black,
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColorSchemes.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
