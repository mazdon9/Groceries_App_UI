import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ProductDetailExpandableWidget extends StatelessWidget {
  final String title;
  final String content;
  final Widget? trailing;
  final bool isExpanded;
  final VoidCallback? onToggle;

  const ProductDetailExpandableWidget({
    super.key,
    required this.title,
    required this.content,
    this.trailing,
    required this.isExpanded,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Container(height: 1, color: AppColorSchemes.grey.withAlpha(77)),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: onToggle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTypography.textFont16W600.copyWith(
                    color: AppColorSchemes.black,
                  ),
                ),
                Row(
                  children: [
                    if (trailing != null) ...[
                      trailing!,
                      const SizedBox(width: 12),
                    ],
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 200),
                      turns: isExpanded ? 0.5 : 0,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColorSchemes.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isExpanded ? null : 0,
            child: isExpanded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        style: AppTypography.textFont14W500.copyWith(
                          color: AppColorSchemes.grey,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class ProductDetailSectionsWidget extends StatelessWidget {
  final bool productDetailExpanded;
  final bool nutritionsExpanded;
  final bool reviewExpanded;
  final VoidCallback onProductDetailToggle;
  final VoidCallback onNutritionsToggle;
  final VoidCallback onReviewToggle;

  const ProductDetailSectionsWidget({
    super.key,
    required this.productDetailExpanded,
    required this.nutritionsExpanded,
    required this.reviewExpanded,
    required this.onProductDetailToggle,
    required this.onNutritionsToggle,
    required this.onReviewToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        ProductDetailExpandableWidget(
          title: 'Product Detail',
          content:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
          isExpanded: productDetailExpanded,
          onToggle: onProductDetailToggle,
        ),
        ProductDetailExpandableWidget(
          title: 'Nutritions',
          content:
              'Rich in vitamins, minerals, and dietary fiber. Contains antioxidants and natural sugars. Low in calories and fat-free.',
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColorSchemes.grey.withAlpha(51),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '100gr',
              style: AppTypography.textFont14W500.copyWith(
                color: AppColorSchemes.grey,
              ),
            ),
          ),
          isExpanded: nutritionsExpanded,
          onToggle: onNutritionsToggle,
        ),
        ProductDetailExpandableWidget(
          title: 'Review',
          content:
              'Great product! Fresh and delicious. Highly recommended for healthy snacking.',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(5, (index) {
                return Icon(Icons.star, color: Colors.orange, size: 16);
              }),
            ],
          ),
          isExpanded: reviewExpanded,
          onToggle: onReviewToggle,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
