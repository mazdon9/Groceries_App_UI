import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
import 'package:groceries_app/presentation/app_imports.dart';
import 'package:groceries_app/presentation/bloc/account/account_bloc.dart';
import 'package:groceries_app/presentation/bloc/account/account_event.dart';
import 'package:groceries_app/presentation/bloc/account/account_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountBloc(FailureMapper(context))..add(OnGetUserInfoAccountEvent()),
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
                title: context.appLocalizations.orders,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.details,
                title: context.appLocalizations.myDetails,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.location,
                title: context.appLocalizations.deliveryAddress,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.payment,
                title: context.appLocalizations.paymentMethods,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.promo,
                title: context.appLocalizations.promoCard,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.bell,
                title: context.appLocalizations.notifications,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.help,
                title: context.appLocalizations.help,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.about,
                title: context.appLocalizations.about,
                onTap: () {},
              ),
              AccountSettingItemWidget(
                iconPath: AppIconPath.about,
                title: context.appLocalizations.language,
                onTap: () {},
                hasSwitchButton: true,
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
                onTap: () {
                  context.go(RouteName.loginPath);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
