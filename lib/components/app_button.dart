import 'package:flutter/material.dart';
import 'package:groceries_app/components/app_text.dart';
import 'package:groceries_app/components/app_text_style.dart';
import 'package:groceries_app/contants/app_color_path.dart';

class AppButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;

  const AppButton({required this.content, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth - 31 - 30,
        height: 75,
        decoration: BoxDecoration(
          color: AppColorPath.white,
          borderRadius: BorderRadius.circular(59),
        ),
        child: Center(
          child: AppText(
            title: content,
            style: AppTextStyle.textFont18W600.copyWith(
              color: AppColorPath.darkBlue,
              fontSize: 17.6,
            ),
          ),
        ),
      ),
    );
  }
}
