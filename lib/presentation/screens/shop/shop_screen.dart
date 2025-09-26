import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
import 'package:groceries_app/presentation/bloc/shop/shop_bloc.dart';
import 'package:groceries_app/presentation/bloc/shop/shop_event.dart';
import 'package:groceries_app/presentation/bloc/shop/shop_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:groceries_app/presentation/screens/shop/widgets/shop_banner_widget.dart';
import 'package:groceries_app/presentation/screens/shop/widgets/shop_product_card_widget.dart';
import 'package:groceries_app/presentation/screens/shop/widgets/shop_section_header_widget.dart';
import 'package:groceries_app/presentation/shared/common_dialogs.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(FailureMapper(context)),
      child: ShopView(),
    );
  }
}

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ShopBloc, ShopState>(
        listener: (context, state) {
          if (state.isLoading) {
            CommonDialogs.showLoadingDialog(context);
          } else {
            CommonDialogs.hideLoadingDialog(context);
            if (state.apiErrorMessage.isNotEmpty) {
              CommonDialogs.showErrorDialog(
                context: context,
                message: state.apiErrorMessage,
                onTap: () =>
                    context.read<ShopBloc>().add(OnClearShopErrorMessage()),
              );
            }
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 20.h + kToolbarHeight),
              // Header with logo
              Center(
                child: Image.asset(
                  AppImagesPath.logoOrange,
                  height: 26,
                  width: 26,
                ),
              ),
              SizedBox(height: 16.h),
              // Location
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16.w,
                    color: AppColorSchemes.grey,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Dhaka, Banasree',
                    style: AppTypography.textFont18W600.copyWith(
                      color: AppColorSchemes.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Search bar
              Container(
                height: 51.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColorSchemes.grey.withAlpha(38),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 20, color: AppColorSchemes.grey),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Store',
                          hintStyle: AppTypography.textFont14W500.copyWith(
                            color: AppColorSchemes.grey,
                          ),
                          border: InputBorder.none,
                        ),
                        enabled: false, // Logic để trống
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // Banner
              const ShopBannerWidget(),
              SizedBox(height: 30.h),
              BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  if (state.listOfCategoryProductsEntity != null) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final item = state
                            .listOfCategoryProductsEntity!
                            .listOfCategoryProductsEntity[index];
                        return Column(
                          children: [
                            ShopSectionHeaderWidget(
                              title: item.category,
                              onSeeAll: () {},
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: 230.h,
                              width: context.screenWidth,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 20.w),
                                itemCount: item.products.length,
                                itemBuilder: (context, index) {
                                  final product = item.products[index];
                                  return ShopProductCardWidget(
                                    product: product,
                                    imagePath: product.thumbnail,
                                    title: product.title,
                                    subtitle: product.weight.toString(),
                                    price: '\$${product.price.toString()}',
                                    onAddToCart: () {},
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemCount: state
                          .listOfCategoryProductsEntity!
                          .listOfCategoryProductsEntity
                          .length,
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

// class ShopScreen extends StatelessWidget {
//   const ShopScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColorSchemes.white,
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           children: [
//             const SizedBox(height: 20),
//             // Header with logo
//             Center(
//               child: Image.asset(
//                 AppImagesPath.logoOrange,
//                 height: 26,
//                 width: 26,
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Location
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.location_on_outlined,
//                   size: 16,
//                   color: AppColorSchemes.grey,
//                 ),
//                 const SizedBox(width: 4),
//                 Text(
//                   'Dhaka, Banasree',
//                   style: AppTypography.textFont18W600.copyWith(
//                     color: AppColorSchemes.grey,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             // Search bar
//             Container(
//               height: 51,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: AppColorSchemes.grey.withAlpha(38),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.search, size: 20, color: AppColorSchemes.grey),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search Store',
//                         hintStyle: AppTypography.textFont14W500.copyWith(
//                           color: AppColorSchemes.grey,
//                         ),
//                         border: InputBorder.none,
//                       ),
//                       enabled: false, // Logic để trống
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Banner
//             const ShopBannerWidget(),
//             const SizedBox(height: 30),
//             // Exclusive Offer Section
//             ShopSectionHeaderWidget(
//               title: 'Exclusive Offer',
//               onSeeAll: () {
//                 // Logic để trống
//               },
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 230,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(right: 25),
//                 children: [
//                   ShopProductCardWidget(
//                     imagePath: AppImagesPath.organicBannanasCart,
//                     title: 'Organic Bananas',
//                     subtitle: '7pcs, Priceg',
//                     price: '\$4.99',
//                     onAddToCart: () {
//                       // Logic để trống
//                     },
//                   ),
//                   const SizedBox(width: 15),
//                   ShopProductCardWidget(
//                     imagePath: AppImagesPath.appleAndGrapeJuiceCart,
//                     title: 'Red Apple',
//                     subtitle: '1kg, Priceg',
//                     price: '\$4.99',
//                     onAddToCart: () {
//                       // Logic để trống
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             // Best Selling Section
//             ShopSectionHeaderWidget(
//               title: 'Best Selling',
//               onSeeAll: () {
//                 // Logic để trống
//               },
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 230,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(right: 25),
//                 children: [
//                   ShopProductCardWidget(
//                     imagePath: AppImagesPath.bellPepperRedCart,
//                     title: 'Bell Pepper Red',
//                     subtitle: '1kg, Priceg',
//                     price: '\$4.99',
//                     onAddToCart: () {
//                       // Logic để trống
//                     },
//                   ),
//                   const SizedBox(width: 15),
//                   ShopProductCardWidget(
//                     imagePath: AppImagesPath.gingerCart,
//                     title: 'Ginger',
//                     subtitle: '250gm, Priceg',
//                     price: '\$4.99',
//                     onAddToCart: () {
//                       // Logic để trống
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             // Groceries Section
//             ShopSectionHeaderWidget(
//               title: 'Groceries',
//               onSeeAll: () {
//                 // Logic để trống
//               },
//             ),
//             const SizedBox(height: 20),
//             const ShopCategoryWidget(),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 230,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(right: 25),
//                 children: [
//                   ShopProductCardWidget(
//                     imagePath: AppImagesPath.eggChickenRedCart,
//                     title: 'Beef Bone',
//                     subtitle: '1kg, Priceg',
//                     price: '\$4.99',
//                     onAddToCart: () {
//                       // Logic để trống
//                     },
//                   ),
//                   const SizedBox(width: 15),
//                   ShopProductCardWidget(
//                     imagePath: AppImagesPath.eggChickenWhiteCart,
//                     title: 'Broiler Chicken',
//                     subtitle: '1kg, Priceg',
//                     price: '\$4.99',
//                     onAddToCart: () {
//                       // Logic để trống
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
