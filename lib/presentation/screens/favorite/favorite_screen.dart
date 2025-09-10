import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/screens/favorite/widgets/favorite_setting_item_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

typedef SwitchTabCallback = void Function(int index);

class FavoriteScreen extends StatelessWidget {
  final SwitchTabCallback? onSwitchTab;
  const FavoriteScreen({super.key, this.onSwitchTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favourite',
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
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.spirteCanCart,
                  width: 31.w,
                  height: 55.h,
                  title: 'Sprite Can',
                  subtitle: '325ml, Price',
                  price: '\$1.50',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.dietCokeCart,
                  width: 27.w,
                  height: 53.h,
                  title: 'Diet Coke',
                  subtitle: '355ml, Price',
                  price: '\$1.99',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.appleAndGrapeJuiceCart,
                  width: 32.w,
                  height: 56.h,
                  title: 'Apple & Grape Juice',
                  subtitle: '2L, Price',
                  price: '\$15.50',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.cocaColaCanCart,
                  width: 29.w,
                  height: 54.h,
                  title: 'Coca Cola Can',
                  subtitle: '325ml, Price',
                  price: '\$4.99',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.pepsiCanCart,
                  width: 31.w,
                  height: 58.h,
                  title: 'Pepsi Can',
                  subtitle: '330ml, Price',
                  price: '\$4.99',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.mayonnaiseEgglessCart,
                  width: 32.w,
                  height: 58.h,
                  title: 'Mayonnaise (Eggless)',
                  subtitle: '500g, Price',
                  price: '\$3.99',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
              content: 'Add All To Cart',
              iconPath: AppIconPath.logout,
              textStyle: AppTypography.textFont18W600.copyWith(
                color: AppColorSchemes.white,
              ),
              // borderColor: AppColorSchemes.green, // Removed because AppButton does not support this parameter
              backgroundColor: AppColorSchemes.green,

              width: 364.w,
              onTap: () {
                if (onSwitchTab != null) {
                  onSwitchTab!(2); // 2 is the index for Cart tab
                }
                // Implement your add all to cart logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
