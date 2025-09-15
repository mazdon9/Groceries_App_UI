import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ShopCategoryWidget extends StatelessWidget {
  const ShopCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryItem(
            'Pulses',
            Colors.orange.withOpacity(0.15),
            Colors.orange,
          ),
          const SizedBox(width: 16),
          _buildCategoryItem(
            'Rice',
            AppColorSchemes.green.withOpacity(0.15),
            AppColorSchemes.green,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    String title,
    Color backgroundColor,
    Color borderColor,
  ) {
    return Container(
      width: 248,
      height: 105,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        children: [
          // Placeholder for category image
          Container(
            width: 71,
            height: 71,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.category, color: borderColor, size: 40),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: AppTypography.textFont18W600.copyWith(
              color: AppColorSchemes.black,
            ),
          ),
        ],
      ),
    );
  }
}
