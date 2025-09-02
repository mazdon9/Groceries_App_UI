import 'package:flutter/material.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
import 'package:groceries_app/presentation/screens/account/widgets/account_profile_widget.dart';
import 'package:groceries_app/presentation/screens/account/widgets/account_setting_item_widget.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AccountProfileWidget(
                name: 'Afsar Hossen',
                email: 'imshuvo97@gmail.com',
                avatarPath: AppImagesPath.avatar,
              ),
              const SizedBox(height: 8),
              AccountSettingItemWidget(
                iconPath: AppIconPath.orders,
                title: 'Orders',
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.details,
                title: 'My Details',
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.location,
                title: 'Delivery Address',
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.payment,
                title: 'Payment Methods',
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.promo,
                title: 'Promo Cord',
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.bell,
                title: 'Notifications',
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.help,
                title: 'Help',
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.about,
                title: 'About',
                onTap: () {},
              ),
              const SizedBox(height: 53),
              AppButton(
                content: 'Log Out',
                textStyle: AppTypography.textFont18W600.copyWith(
                  color: AppColorSchemes.black,
                ),
                borderColors: Border.all(
                  color: AppColorSchemes.green,
                  width: 1,
                ),
                backgroundColor: AppColorSchemes.greyLight,
                width: (364 / 414) * context.screenWidth,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
