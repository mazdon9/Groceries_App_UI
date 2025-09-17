import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product_detail/product_detail_bloc.dart';
import '../../bloc/product_detail/product_detail_event.dart';
import '../../bloc/product_detail/product_detail_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailBloc(),
      child: Scaffold(
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
                  // ...existing code...
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
                      // ...existing code...
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ProductDetailBloc, ProductDetailState>(
                      buildWhen: (prev, curr) =>
                          prev.isFavorite != curr.isFavorite,
                      builder: (context, state) {
                        return ProductDetailImageWidget(
                          imagePath: widget.product.thumbnail,
                          isFavorite: state.isFavorite,
                          onFavoriteToggle: () {
                            context.read<ProductDetailBloc>().add(
                              ToggleFavorite(),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.product.title,
                                  style: AppTypography.textFont26W600.copyWith(
                                    color: AppColorSchemes.black,
                                  ),
                                ),
                              ),
                              BlocBuilder<
                                ProductDetailBloc,
                                ProductDetailState
                              >(
                                buildWhen: (prev, curr) =>
                                    prev.isFavorite != curr.isFavorite,
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.read<ProductDetailBloc>().add(
                                        ToggleFavorite(),
                                      );
                                    },
                                    child: Icon(
                                      state.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: state.isFavorite
                                          ? Colors.red
                                          : AppColorSchemes.grey,
                                      size: 24,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${widget.product.weight}g, Price',
                            style: AppTypography.textFont16W500.copyWith(
                              color: AppColorSchemes.grey,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              BlocBuilder<
                                ProductDetailBloc,
                                ProductDetailState
                              >(
                                buildWhen: (prev, curr) =>
                                    prev.quantity != curr.quantity,
                                builder: (context, state) {
                                  return ProductDetailQuantityWidget(
                                    initialQuantity: state.quantity,
                                    onQuantityChanged: (newQuantity) {
                                      context.read<ProductDetailBloc>().add(
                                        ChangeQuantity(newQuantity),
                                      );
                                    },
                                  );
                                },
                              ),
                              const Spacer(),
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
                    BlocBuilder<ProductDetailBloc, ProductDetailState>(
                      buildWhen: (prev, curr) =>
                          prev.productDetailExpanded !=
                              curr.productDetailExpanded ||
                          prev.nutritionsExpanded != curr.nutritionsExpanded ||
                          prev.reviewExpanded != curr.reviewExpanded,
                      builder: (context, state) {
                        return ProductDetailSectionsWidget(
                          productDetailExpanded: state.productDetailExpanded,
                          nutritionsExpanded: state.nutritionsExpanded,
                          reviewExpanded: state.reviewExpanded,
                          onProductDetailToggle: () {
                            context.read<ProductDetailBloc>().add(
                              ToggleProductDetailExpanded(),
                            );
                          },
                          onNutritionsToggle: () {
                            context.read<ProductDetailBloc>().add(
                              ToggleNutritionsExpanded(),
                            );
                          },
                          onReviewToggle: () {
                            context.read<ProductDetailBloc>().add(
                              ToggleReviewExpanded(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              color: AppColorSchemes.white,
              child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                buildWhen: (prev, curr) => prev.quantity != curr.quantity,
                builder: (context, state) {
                  return AppButton(
                    content: 'Add To Basket',
                    textStyle: AppTypography.textFont18W600.copyWith(
                      color: AppColorSchemes.white,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added ${widget.product.title} (x${state.quantity}) to basket',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    backgroundColor: AppColorSchemes.green,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
