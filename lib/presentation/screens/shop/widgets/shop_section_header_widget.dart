import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ShopSectionHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const ShopSectionHeaderWidget({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.textFont22W600.copyWith(
            color: AppColorSchemes.black,
          ),
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: Text(
            'See all',
            style: AppTypography.textFont16W600.copyWith(
              color: AppColorSchemes.green,
            ),
          ),
        ),
      ],
    );
  }
}
