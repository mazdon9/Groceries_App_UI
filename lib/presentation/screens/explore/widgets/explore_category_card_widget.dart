import 'dart:math';

import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ExploreCategoryCardWidget extends StatelessWidget {
  final String categoryName;
  final String? imagePath;
  final VoidCallback? onTap;

  const ExploreCategoryCardWidget({
    super.key,
    required this.categoryName,
    this.imagePath,
    this.onTap,
  });

  // Random pastel colors list
  static const List<Color> _cardColors = [
    Color(0xFFE8F5E8), // Light green
    Color(0xFFFFF2E8), // Light orange
    Color(0xFFFFE8F0), // Light pink
    Color(0xFFE8E8FF), // Light purple
    Color(0xFFFFF8E8), // Light yellow
    Color(0xFFE8F8FF), // Light blue
  ];

  Color _getRandomColor() {
    final random = Random(categoryName.hashCode);
    return _cardColors[random.nextInt(_cardColors.length)];
  }

  String _formatCategoryName(String name) {
    // Convert category name to display format
    // e.g., "mens-shirts" -> "Men's Shirts"
    return name
        .split('-')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : word,
        )
        .join(' ')
        .replaceAll('Mens ', "Men's ")
        .replaceAll('Womens ', "Women's ");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 174,
        height: 189,
        decoration: BoxDecoration(
          color: _getRandomColor(),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColorSchemes.grey.withAlpha(51),
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Image
              Expanded(
                child: Center(
                  child: imagePath != null
                      ? Image.asset(
                          imagePath!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColorSchemes.grey.withAlpha(102),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.category,
                            size: 50,
                            color: AppColorSchemes.grey,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              // Category Name
              Text(
                _formatCategoryName(categoryName),
                style: AppTypography.textFont16W600.copyWith(
                  color: AppColorSchemes.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
