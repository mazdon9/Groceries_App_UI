import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class AppButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;
  final double width;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Border? borderColors;
  final String? iconPath;

  const AppButton({
    required this.content,
    required this.onTap,
    this.width = double.infinity,
    this.backgroundColor,
    super.key,
    this.textStyle,
    this.borderColors,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        // height: 67.h,
        decoration: BoxDecoration(
          border: borderColors,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(59.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 22.5.h, horizontal: 24.w),
        child: Row(
          children: [
            if (iconPath != null)
              Image.asset(
                iconPath!,
                color: AppColorSchemes.green,
                width: 24.w,
                height: 24.w,
              ),
            Expanded(
              child: AppText(
                title: content,
                textAlign: TextAlign.center,
                style:
                    textStyle ??
                    AppTypography.textFont18W600.copyWith(
                      color: backgroundColor == null
                          ? AppColorSchemes.white
                          : AppColorSchemes.green,
                    ),
              ),
            ),
            if (iconPath != null) SizedBox(width: 24.w),
          ],
        ),
      ),
    );
  }
}
