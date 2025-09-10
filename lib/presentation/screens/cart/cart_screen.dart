import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/screens/cart/widgets/cart_setting_item_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CartSettingItemWidget(
                  imagePath: AppImagesPath.bellPepperRedCart,
                  width: 71.w,
                  height: 65.h,
                  title: 'Bell Pepper Red',
                  subtitle: '1kg, Price',
                  price: '\$4.99',
                  quantity: 1,
                ),
                CartSettingItemWidget(
                  imagePath: AppImagesPath.eggChickenRedCart,
                  width: 87.w,
                  height: 87.h,
                  title: 'Egg Chicken Red',
                  subtitle: '4pcs, Price',
                  price: '\$1.99',
                  quantity: 1,
                ),
                CartSettingItemWidget(
                  imagePath: AppImagesPath.organicBannanasCart,
                  width: 69.w,
                  height: 55.h,
                  title: 'Organic Bananas',
                  subtitle: '12kg, Price',
                  price: '\$3.00',
                  quantity: 1,
                ),
                CartSettingItemWidget(
                  imagePath: AppImagesPath.gingerCart,
                  width: 73.w,
                  height: 65.h,
                  title: 'Ginger',
                  subtitle: '250gm, Price',
                  price: '\$2.99',
                  quantity: 1,
                ),
                CartSettingItemWidget(
                  imagePath: AppImagesPath.eggChickenWhiteCart,
                  width: 73.w,
                  height: 65.h,
                  title: 'Egg Chicken White',
                  subtitle: '4pcs, Price',
                  price: '\$2.55',
                  quantity: 1,
                ),
              ],
            ),
          ),
          Padding(
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
                  '\$12.96',
                  style: TextStyle(
                    color: AppColorSchemes.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
