import 'package:flutter/material.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/screens/favorite/widgets/favorite_setting_item_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
                  title: 'Sprite Can',
                  subtitle: '325ml, Price',
                  price: '\n$1.50',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.dietCokeCart,
                  title: 'Diet Coke',
                  subtitle: '355ml, Price',
                  price: '\n$1.99',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.appleAndGrapeJuiceCart,
                  title: 'Apple & Grape Juice',
                  subtitle: '2L, Price',
                  price: '\n$15.50',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.cocaColaCanCart,
                  title: 'Coca Cola Can',
                  subtitle: '325ml, Price',
                  price: '\n$4.99',
                ),
                FavoriteSettingItemWidget(
                  imagePath: AppImagesPath.pepsiCanCart,
                  title: 'Pepsi Can',
                  subtitle: '330ml, Price',
                  price: '\n$4.99',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Add All To Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
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
