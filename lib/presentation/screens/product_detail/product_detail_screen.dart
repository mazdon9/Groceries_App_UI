import 'package:chottu_link/chottu_link.dart';
import 'package:chottu_link/dynamic_link/cl_dynamic_link_behaviour.dart';
import 'package:chottu_link/dynamic_link/cl_dynamic_link_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/presentation/bloc/detail/detail_bloc.dart';
import 'package:groceries_app/presentation/bloc/detail/detail_event.dart';
import 'package:groceries_app/presentation/bloc/detail/detail_state.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/screens/product_detail/widgets/product_detail_expandable_widget.dart';
import 'package:groceries_app/presentation/screens/product_detail/widgets/product_detail_image_slider_widget.dart';
import 'package:groceries_app/presentation/screens/product_detail/widgets/product_detail_quantity_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/common_dialogs.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;
  final bool isFromDeepLink;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    this.isFromDeepLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<DetailBloc>()
            ..add(OnLoadProductDetailEvent(productId)),
      child: ProductDetailView(
        isFromDeepLink: isFromDeepLink,
        productId: productId,
      ),
    );
  }
}

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({
    super.key,
    required this.isFromDeepLink,
    required this.productId,
  });

  final bool isFromDeepLink;
  final int productId;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int _quantity = 1;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.white,
      body: BlocListener<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state.isLoading) {
            CommonDialogs.showLoadingDialog(context);
          } else {
            CommonDialogs.hideLoadingDialog(context);
            if (state.apiErrorMessage.isNotEmpty) {
              CommonDialogs.showErrorDialog(
                context: context,
                message: state.apiErrorMessage,
                onTap: () => context.read<DetailBloc>().add(
                  const OnClearDetailErrorMessage(),
                ),
              );
            }
          }
        },
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            final product = state.productDetailEntity;

            if (product == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                // Custom AppBar
                SafeArea(
                  child: Container(
                    height: 60,
                    color: AppColorSchemes.white,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.isFromDeepLink) {
                              context.go(RouteName.dashboardPath);
                            } else {
                              context.pop();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            width: 44,
                            height: 44,
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
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text(
                            //       'Share functionality will be implemented later',
                            //     ),
                            //     duration: Duration(seconds: 2),
                            //   ),
                            // );
                            _buildShareFunction();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            width: 44,
                            height: 44,
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
                  ),
                ),
                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Images Slider
                          ProductDetailImageSliderWidget(
                            images: product.images.isNotEmpty
                                ? product.images
                                : [product.thumbnail],
                            isFavorite: _isFavorite,
                            onFavoriteToggle: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                          ),
                          const SizedBox(height: 30),
                          // Product Info
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title and Favorite Row
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product.title,
                                        style: AppTypography.textFont18W600
                                            .copyWith(
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
                                // Brand and Category
                                Text(
                                  '${product.brand.isNotEmpty ? '${product.brand} • ' : ''}${product.category}',
                                  style: AppTypography.textFont16W500.copyWith(
                                    color: AppColorSchemes.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Rating and Stock
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${product.rating.toStringAsFixed(1)} • ',
                                      style: AppTypography.textFont14W500
                                          .copyWith(
                                            color: AppColorSchemes.grey,
                                          ),
                                    ),
                                    Text(
                                      'Stock: ${product.stock}',
                                      style: AppTypography.textFont14W500
                                          .copyWith(
                                            color: product.stock > 0
                                                ? AppColorSchemes.green
                                                : Colors.red,
                                          ),
                                    ),
                                  ],
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
                                    // Discount and Price
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        if (product.discountPercentage > 0) ...[
                                          Text(
                                            '-${product.discountPercentage.toStringAsFixed(0)}%',
                                            style: AppTypography.textFont14W500
                                                .copyWith(color: Colors.red),
                                          ),
                                          const SizedBox(height: 4),
                                        ],
                                        Text(
                                          '\$${product.price.toStringAsFixed(2)}',
                                          style: AppTypography.textFont26W600
                                              .copyWith(
                                                color: AppColorSchemes.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Expandable Sections with Real Data
                          ProductDetailSectionsWidget(
                            description: product.description,
                            nutritionInfo:
                                'Weight: ${product.weight}g\nBrand: ${product.brand}',
                            reviews: product.reviews,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Fixed Add to Basket Button
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  color: AppColorSchemes.white,
                  child: AppButton(
                    content: 'Add To Basket',
                    textStyle: AppTypography.textFont18W600.copyWith(
                      color: AppColorSchemes.white,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added ${product.title} (x$_quantity) to basket',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    backgroundColor: AppColorSchemes.green,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _buildShareFunction() {
    /// Create dynamic link parameters
    final parameters = CLDynamicLinkParameters(
      link: Uri.parse(
        "https://onlinegrocerystore.chottu.link/product/${widget.productId}",
      ), // Target deep link
      domain: "onlinegrocerystore.chottu.link", // Your ChottuLink domain
      // Set behavior for Android & iOS
      androidBehaviour: CLDynamicLinkBehaviour.app,
      iosBehaviour: CLDynamicLinkBehaviour.app,

      // // UTM Tracking (for analytics)
      // utmCampaign: "exampleCampaign",
      // utmMedium: "exampleMedium",
      // utmSource: "exampleSource",
      // utmContent: "exampleContent",
      // utmTerm: "exampleTerm",

      // // Optional metadata
      // linkName: "linkname",
      // selectedPath: "customPath",
      // socialTitle: "Social Title",
      // socialDescription: "Description to show when shared",
      // socialImageUrl:
      //     "https://yourdomain.com/image.png", // Must be a valid image URL
    );

    ChottuLink.createDynamicLink(
      parameters: parameters,
      onSuccess: (link) {
        debugPrint("✅ Shared Link: $link"); // 🔗 Successfully created link
        SharePlus.instance.share(
          ShareParams(title: 'Please check this Product', uri: Uri.parse(link)),
        );
      },
      onError: (error) {
        debugPrint("❌ Error creating link: ${error.description}");
        SharePlus.instance.share(
          ShareParams(
            title: 'Please check this Product',
            uri: Uri.parse(
              "https://onlinegrocerystore.chottu.link/product/${widget.productId}",
            ),
          ),
        );
      },
    );
  }
}
