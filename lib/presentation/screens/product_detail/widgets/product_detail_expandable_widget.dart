import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ProductDetailExpandableWidget extends StatefulWidget {
  final String title;
  final String content;
  final Widget? trailing;

  const ProductDetailExpandableWidget({
    super.key,
    required this.title,
    required this.content,
    this.trailing,
  });

  @override
  State<ProductDetailExpandableWidget> createState() =>
      _ProductDetailExpandableWidgetState();
}

class _ProductDetailExpandableWidgetState
    extends State<ProductDetailExpandableWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          // Divider
          Container(height: 1, color: AppColorSchemes.grey.withAlpha(77)),
          const SizedBox(height: 16),
          // Header Row
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: AppTypography.textFont16W600.copyWith(
                    color: AppColorSchemes.black,
                  ),
                ),
                Row(
                  children: [
                    if (widget.trailing != null) ...[
                      widget.trailing!,
                      const SizedBox(width: 12),
                    ],
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 200),
                      turns: _isExpanded ? 0.5 : 0,
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
          // Expandable Content
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isExpanded ? null : 0,
            child: _isExpanded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.content,
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
  final String? description;
  final String? nutritionInfo;
  final List<dynamic>? reviews;

  const ProductDetailSectionsWidget({
    super.key,
    this.description,
    this.nutritionInfo,
    this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        // Product Detail Section
        ProductDetailExpandableWidget(
          title: 'Product Detail',
          content: description ?? 'No product description available.',
        ),
        // Nutritions Section
        ProductDetailExpandableWidget(
          title: 'Nutritions',
          content: nutritionInfo ?? 'Nutrition information not available.',
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
        ),
        // Review Section
        ProductDetailExpandableWidget(
          title: 'Review',
          content: _buildReviewContent(),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: _buildStarRating(),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  String _buildReviewContent() {
    if (reviews == null || reviews!.isEmpty) {
      return 'No reviews available for this product.';
    }

    final StringBuffer content = StringBuffer();
    for (int i = 0; i < reviews!.length && i < 3; i++) {
      final review = reviews![i];
      content.writeln('⭐ ${review.rating}/5 - ${review.reviewerName}');
      content.writeln('"${review.comment}"');
      if (i < reviews!.length - 1 && i < 2) content.writeln();
    }

    if (reviews!.length > 3) {
      content.writeln('\n... and ${reviews!.length - 3} more reviews');
    }

    return content.toString();
  }

  List<Widget> _buildStarRating() {
    if (reviews == null || reviews!.isEmpty) {
      return List.generate(5, (index) {
        return Icon(Icons.star_border, color: Colors.grey, size: 16);
      });
    }

    // Calculate average rating
    double totalRating = 0;
    for (final review in reviews!) {
      totalRating += review.rating;
    }
    double averageRating = totalRating / reviews!.length;

    return List.generate(5, (index) {
      if (index < averageRating.floor()) {
        return Icon(Icons.star, color: Colors.orange, size: 16);
      } else if (index < averageRating) {
        return Icon(Icons.star_half, color: Colors.orange, size: 16);
      } else {
        return Icon(Icons.star_border, color: Colors.grey, size: 16);
      }
    });
  }
}
