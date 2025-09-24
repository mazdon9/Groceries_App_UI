import 'package:flutter/material.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';
import 'package:groceries_app/presentation/screens/product_detail/widgets/product_detail_expandable_widget.dart';
import 'package:groceries_app/presentation/screens/product_detail/widgets/product_detail_image_widget.dart';
import 'package:groceries_app/presentation/screens/product_detail/widgets/product_detail_quantity_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetailEntity product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.white,
      appBar: AppBar(
        backgroundColor: AppColorSchemes.grey.withAlpha(25),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColorSchemes.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColorSchemes.black,
              size: 18,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Logic để trống - sẽ implement sau
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Share functionality will be implemented later',
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColorSchemes.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.share_outlined,
                color: AppColorSchemes.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  ProductDetailImageWidget(
                    imagePath: widget.product.thumbnail,
                    isFavorite: _isFavorite,
                    onFavoriteToggle: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  // Product Info with Title, Subtitle, Favorite and Quantity/Price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Favorite Row
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.product.title,
                                style: AppTypography.textFont18W600.copyWith(
                                  color: AppColorSchemes.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              child: Icon(
                                _isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _isFavorite
                                    ? Colors.red
                                    : AppColorSchemes.grey,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Subtitle
                        Text(
                          '${widget.product.weight}g, Price',
                          style: AppTypography.textFont16W500.copyWith(
                            color: AppColorSchemes.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Quantity and Price Row
                        Row(
                          children: [
                            // Quantity Selector
                            ProductDetailQuantityWidget(
                              initialQuantity: _quantity,
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantity = newQuantity;
                                });
                              },
                            ),
                            const Spacer(),
                            // Price
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: AppTypography.textFont26W600.copyWith(
                                color: AppColorSchemes.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Expandable Sections
                  const ProductDetailSectionsWidget(),
                ],
              ),
            ),
          ),
          // Fixed Add to Basket Button
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            color: AppColorSchemes.white,
            child: AppButton(
              content: 'Add To Basket',
              textStyle: AppTypography.textFont18W600.copyWith(
                color: AppColorSchemes.white,
              ),
              onTap: () {
                // Logic để trống - sẽ implement sau
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added ${widget.product.title} (x$_quantity) to basket',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              backgroundColor: AppColorSchemes.green,
            ),
          ),
        ],
      ),
    );
  }
}
