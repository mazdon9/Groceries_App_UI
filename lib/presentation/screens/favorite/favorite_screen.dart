import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/app_imports.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:groceries_app/presentation/screens/favorite/widgets/favorite_setting_item_widget.dart';

typedef SwitchTabCallback = void Function(int index);

class FavoriteScreen extends StatelessWidget {
  final SwitchTabCallback? onSwitchTab;
  const FavoriteScreen({super.key, this.onSwitchTab});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(FailureMapper(context)),
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
        backgroundColor: AppColorSchemes.white,

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(32),
          child: Container(
            color: AppColorSchemes.black.withAlpha(70),
            height: 1.0,
          ),
        ),

        elevation: 0,
        centerTitle: true,

        title: AppText(
          title: 'Favourite',
          style: AppTypography.textFont22W600.copyWith(
            color: AppColorSchemes.black,
          ),
        ),
        iconTheme: IconThemeData(color: AppColorSchemes.black),
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
                            width: 70.w,
                            height: 70.h,
                            title: item.title,
                            subtitle: '1 Item',
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
