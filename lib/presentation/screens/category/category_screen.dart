import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries_app/presentation/bloc/category/category_bloc.dart';
import 'package:groceries_app/presentation/bloc/category/category_event.dart';
import 'package:groceries_app/presentation/bloc/category/category_state.dart';
import 'package:groceries_app/presentation/screens/shop/widgets/shop_product_card_widget.dart';
import 'package:groceries_app/presentation/shared/common_dialogs.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<CategoryBloc>()
            ..add(OnLoadProductsByCategoryEvent(categoryName)),
      child: CategoryView(categoryName: categoryName),
    );
  }
}

class CategoryView extends StatelessWidget {
  final String categoryName;

  const CategoryView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.white,
      body: BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state.isLoading) {
            CommonDialogs.showLoadingDialog(context);
          } else {
            CommonDialogs.hideLoadingDialog(context);
            if (state.apiErrorMessage.isNotEmpty) {
              CommonDialogs.showErrorDialog(
                context: context,
                message: state.apiErrorMessage,
                onTap: () => context.read<CategoryBloc>().add(
                  const OnClearCategoryErrorMessage(),
                ),
              );
            }
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Container(
                height: 87.h,
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: AppColorSchemes.black,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          categoryName,
                          style: AppTypography.textFont18W600.copyWith(
                            color: AppColorSchemes.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Implement filter functionality
                      },
                      child: Icon(
                        Icons.tune,
                        size: 18,
                        color: AppColorSchemes.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Products List
              Expanded(
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state.productsByCategoryEntity?.products != null) {
                      final products = state.productsByCategoryEntity!.products;

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: GridView.builder(
                          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 174 / 248,
                                crossAxisSpacing: 15.w,
                                mainAxisSpacing: 15.h,
                              ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ShopProductCardWidget(
                              imagePath: product.thumbnail,
                              title: product.title,
                              subtitle: '${product.weight}g, Price',
                              price: '\$${product.price.toStringAsFixed(2)}',
                              product: product,
                              onAddToCart: () {
                                // TODO: Add to cart functionality
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Added ${product.title} to cart',
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
