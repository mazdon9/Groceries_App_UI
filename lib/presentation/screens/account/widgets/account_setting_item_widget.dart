import 'package:flutter/material.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class AccountSettingItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  const AccountSettingItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: (58 / 896) * context.screenHeight,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColorSchemes.black.withAlpha(70)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(
                iconPath,
                width: 24,
                height: 24,
                color: AppColorSchemes.black,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.textFont18W600.copyWith(
                    color: AppColorSchemes.black,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColorSchemes.grey,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
