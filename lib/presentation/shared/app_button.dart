import 'package:flutter/material.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
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

  const AppButton({
    required this.content,
    required this.onTap,
    this.width = double.infinity,
    this.backgroundColor,
    super.key,
    this.textStyle,
    this.borderColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: (67 / 896) * context.screenHeight,
        decoration: BoxDecoration(
          border: borderColors,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(59),
        ),
        child: Center(
          child: AppText(
            title: content,
            style:
                textStyle ??
                AppTypography.textFont18W600.copyWith(
                  color: backgroundColor == null
                      ? AppColorSchemes.white
                      : AppColorSchemes.black,
                ),
          ),
        ),
      ),
    );
  }
}
