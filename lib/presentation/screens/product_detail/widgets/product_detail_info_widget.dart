import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ProductDetailInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double price;
  final double? rating;
  final int? reviewCount;

  const ProductDetailInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.rating,
    this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: AppTypography.textFont18W600.copyWith(
              color: AppColorSchemes.black,
            ),
          ),
          const SizedBox(height: 8),
          // Subtitle
          Text(
            subtitle,
            style: AppTypography.textFont16W500.copyWith(
              color: AppColorSchemes.grey,
            ),
          ),
          const SizedBox(height: 16),
          // Stars, Price and Quantity Row
          Row(
            children: [
              // 5 Stars
              Row(
                children: List.generate(5, (index) {
                  return Icon(Icons.star, color: Colors.orange, size: 20);
                }),
              ),
              const Spacer(),
              // Price
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: AppTypography.textFont26W600.copyWith(
                  color: AppColorSchemes.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
