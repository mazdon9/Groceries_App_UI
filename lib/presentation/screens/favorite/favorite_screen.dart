import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
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
    return BlocProvider(
      create: (context) => FavoriteBloc(FailureMapper()),
      child: FavoriteView(onSwitchTab: onSwitchTab),
    );
  }
}

class FavoriteView extends StatelessWidget {
  final SwitchTabCallback? onSwitchTab;
  const FavoriteView({super.key, this.onSwitchTab});

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
      body: Stack(
        children: [
          Column(
            children: [
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.listOfFavoriteItemEntity != null &&
                      state.listOfFavoriteItemEntity!.items.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.listOfFavoriteItemEntity!.items.length,
                        itemBuilder: (context, index) {
                          final item =
                              state.listOfFavoriteItemEntity!.items[index];
                          return FavoriteSettingItemWidget(
                            imagePath: item.thumbnail,
                            width: 31.w,
                            height: 55.h,
                            title: item.title,
                            subtitle: '325ml, Price',
                            price: item.price.toString(),
                          );
                        },
                      ),
                    );
                  }
                  if (state.apiErrorMessage.isNotEmpty) {
                    return Center(child: Text("Error fetch api favorite"));
                  }
                  return Center(child: Text('No data'));
                },
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Padding(
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
          ),
        ],
      ),
    );
  }
}
