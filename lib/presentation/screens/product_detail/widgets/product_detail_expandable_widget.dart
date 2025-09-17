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
  const ProductDetailSectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        // Product Detail Section
        ProductDetailExpandableWidget(
          title: 'Product Detail',
          content:
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
        ),
        // Nutritions Section
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
        ),
        // Review Section
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
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
