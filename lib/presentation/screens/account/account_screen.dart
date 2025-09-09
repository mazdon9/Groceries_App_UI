import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
import 'package:groceries_app/data/datasources/local/local_storage.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/presentation/app_imports.dart';
import 'package:groceries_app/presentation/bloc/account/account_bloc.dart';
import 'package:groceries_app/presentation/bloc/account/account_event.dart';
import 'package:groceries_app/presentation/bloc/account/account_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountBloc(FailureMapper())..add(OnGetUserInfoAccountEvent()),
      child: AccountView(),
    );
  }
}

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.white,
      appBar: AppBar(
        backgroundColor: AppColorSchemes.lightWhite,
        elevation: 2,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  if (state.userInfoEntity != null) {
                    return AccountProfileWidget(
                      name: state.userInfoEntity!.fullName,
                      email: state.userInfoEntity!.email,
                      avatarPath: state.userInfoEntity!.image,
                    );
                  }
                  return const SizedBox();
                },
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
                iconPath: AppIconPath.logout,
                textStyle: AppTypography.textFont18W600.copyWith(
                  color: AppColorSchemes.black,
                ),
                // borderColor: AppColorSchemes.green, // Removed because AppButton does not support this parameter
                backgroundColor: AppColorSchemes.greyLight,
                width: (364 / 414) * context.screenWidth,
                onTap: () async {
                  final accessToken = await getIt<LocalStorage>()
                      .getAccessToken();
                  print('object $accessToken');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
