import 'package:flutter/material.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/app_imports.dart';
import 'package:groceries_app/presentation/screens/account/account_screen.dart';
import 'package:groceries_app/presentation/screens/cart/cart_screen.dart';
import 'package:groceries_app/presentation/screens/explore/explore_screen.dart';
import 'package:groceries_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:groceries_app/presentation/screens/shop/shop_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: Implement navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ShopScreen(),
          ExploreScreen(),
          CartScreen(),
          FavoriteScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 17, left: 30, right: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: AppColorSchemes.green,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          selectedLabelStyle: AppTypography.textFontI14W500.copyWith(
            color: AppColorSchemes.green,
          ),
          unselectedLabelStyle: AppTypography.textFontI12W500.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          items: [
            _buildBottomNavigationBarItemWidget(index: 0),
            _buildBottomNavigationBarItemWidget(index: 1),
            _buildBottomNavigationBarItemWidget(index: 2),
            _buildBottomNavigationBarItemWidget(index: 3),
            _buildBottomNavigationBarItemWidget(index: 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItemWidget({
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        _bottomNavigationBarItemIconPath(index),
        width: 24,
        height: 24,
        color: _selectedIndex == index
            ? AppColorSchemes.green
            : AppColorSchemes.black,
      ),
      label: _buildBottomNavigationBarItemLabel(index),
    );
  }

  String _bottomNavigationBarItemIconPath(int index) {
    switch (index) {
      case 0:
        return AppIconPath.shop;
      case 1:
        return AppIconPath.explore;
      case 2:
        return AppIconPath.cart;
      case 3:
        return AppIconPath.favorites;
      case 4:
        return AppIconPath.account;
      default:
        return AppIconPath.shop;
    }
  }

  String _buildBottomNavigationBarItemLabel(int index) {
    switch (index) {
      case 0:
        return 'Shop';
      case 1:
        return 'Explore';
      case 2:
        return 'Cart';
      case 3:
        return 'Favorites';
      case 4:
        return 'Account';
      default:
        return 'Shop';
    }
  }
}
