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
        height: (67 / 896) * context.screenHeight,
        decoration: BoxDecoration(
          border: borderColors,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(59),
        ),
        child: Center(
          child: Row(
            children: [
              if (iconPath != null)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    top: 25,
                    bottom: 25,
                    right: 0,
                  ),
                  child: Image.asset(
                    iconPath!,
                    color: AppColorSchemes.green,
                    width: 24,
                    height: 24,
                  ),
                ),
              Expanded(
                child: Center(
                  child: AppText(
                    title: content,
                    style:
                        textStyle ??
                        AppTypography.textFont18W600.copyWith(
                          color: backgroundColor == null
                              ? AppColorSchemes.white
                              : AppColorSchemes.green,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
