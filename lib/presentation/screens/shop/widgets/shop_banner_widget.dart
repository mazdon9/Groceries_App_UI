import 'package:flutter/material.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';

class ShopBannerWidget extends StatelessWidget {
  const ShopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(AppImagesPath.bannerImages),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
