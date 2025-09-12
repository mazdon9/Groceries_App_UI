import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/data/models/params/update_cart_item_params.dart';
import 'package:groceries_app/presentation/bloc/cart/cart_bloc.dart';
import 'package:groceries_app/presentation/bloc/cart/cart_event.dart';
import 'package:groceries_app/presentation/bloc/cart/cart_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:groceries_app/presentation/screens/cart/widgets/cart_setting_item_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartBloc(FailureMapper(context))..add(const OnGetCartItemsEvent(1)),
      child: const CartView(),
    );
  }
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorSchemes.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(32),
          child: Container(
            color: AppColorSchemes.black.withAlpha(70),
            height: 1.0,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: AppText(
          title: 'My Cart',
          style: AppTypography.textFont22W600.copyWith(
            color: AppColorSchemes.black,
          ),
        ),
        iconTheme: IconThemeData(color: AppColorSchemes.black),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (state.apiErrorMessage.isNotEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            "Error fetch api cart: ${state.apiErrorMessage}",
                          ),
                        ),
                      );
                    }

                    if (state.cartEntity != null &&
                        state.cartEntity!.products.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 120.h),
                          itemCount: state.cartEntity!.products.length,
                          itemBuilder: (context, index) {
                            final item = state.cartEntity!.products[index];
                            return CartSettingItemWidget(
                              imagePath: item.thumbnail.isNotEmpty
                                  ? item.thumbnail
                                  : AppImagesPath.bellPepperRedCart,
                              width: 71.w,
                              height: 65.h,
                              title: item.title,
                              subtitle: '${item.quantity} items, Price',
                              price: '\$${item.price.toStringAsFixed(2)}',
                              quantity: item.quantity,
                              onAdd: () {
                                context.read<CartBloc>().add(
                                  OnUpdateCartItemQuantityEvent(
                                    params: UpdateCartItemParams(
                                      cartId: state.cartEntity!.id,
                                      productId: item.id,
                                      quantity: item.quantity + 1,
                                    ),
                                  ),
                                );
                              },
                              onRemove: () {
                                if (item.quantity > 1) {
                                  context.read<CartBloc>().add(
                                    OnUpdateCartItemQuantityEvent(
                                      params: UpdateCartItemParams(
                                        cartId: state.cartEntity!.id,
                                        productId: item.id,
                                        quantity: item.quantity - 1,
                                      ),
                                    ),
                                  );
                                } else {
                                  /// TODO: show dialog inform user
                                }
                              },
                              onDelete: () {
                                // For delete individual item, we update quantity to 0
                                context.read<CartBloc>().add(
                                  OnDeleteAProductInCartEvent(item.id),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }

                    return const Expanded(
                      child: Center(child: Text('No items in cart')),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                final totalPrice = state.cartEntity?.total ?? 0.0;
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppButton(
                    content: 'Go to Checkout',
                    backgroundColor: AppColorSchemes.green,
                    textStyle: AppTypography.textFont18W600.copyWith(
                      color: AppColorSchemes.white,
                    ),
                    width: double.infinity,
                    onTap: () {
                      // TODO: handle checkout logic
                    },
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColorSchemes.darkGreen,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
