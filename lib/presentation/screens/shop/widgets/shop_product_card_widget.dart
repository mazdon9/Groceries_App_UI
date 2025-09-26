import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';
import 'package:groceries_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ShopProductCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final ProductDetailEntity? product; // Thêm product entity
  final VoidCallback? onAddToCart;

  const ShopProductCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    this.product,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Product Detail Screen if product is available
        if (product != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(productId: product!.id),
            ),
          );
        }
      },
      child: Container(
        width: 173,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorSchemes.grey.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 3,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Product Title
            Text(
              title,
              style: AppTypography.textFont16W600.copyWith(
                color: AppColorSchemes.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Product Subtitle
            Text(
              subtitle,
              style: AppTypography.textFont14W500.copyWith(
                color: AppColorSchemes.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    price,
                    style: AppTypography.textFont18W600.copyWith(
                      color: AppColorSchemes.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onAddToCart,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColorSchemes.green,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColorSchemes.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
