import 'package:flutter/material.dart';
import 'package:groceries_app/components/app_text.dart';
import 'package:groceries_app/components/app_text_style.dart';
import 'package:groceries_app/contants/app_color_path.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';

class AppButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;
  final double width;

  const AppButton({
    required this.content,
    required this.onTap,
    this.width = double.infinity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: (67 / 896) * context.screenHeight,
        decoration: BoxDecoration(
          color: AppColorPath.green,
          borderRadius: BorderRadius.circular(59),
        ),
        child: Center(
          child: AppText(
            title: content,
            style: AppTextStyle.textFont18W600.copyWith(
              color: AppColorPath.white,
              fontSize: 17.6,
            ),
          ),
        ),
      ),
    );
  }
}
