import 'package:go_router/go_router.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/screens/account/account_screen.dart';
import 'package:groceries_app/presentation/screens/cart/cart_screen.dart';
import 'package:groceries_app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:groceries_app/presentation/screens/explore/explore_screen.dart';
import 'package:groceries_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:groceries_app/presentation/screens/login/login_screen.dart';
import 'package:groceries_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:groceries_app/presentation/screens/shop/shop_screen.dart';
import 'package:groceries_app/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:groceries_app/presentation/screens/splash/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteName.splashPath,
    routes: [
      GoRoute(
        path: RouteName.splashPath,
        name: RouteName.splashName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteName.onboardingPath,
        name: RouteName.onboardingName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteName.loginPath,
        name: RouteName.loginName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteName.signUpPath,
        name: RouteName.signUpName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: RouteName.dashboardPath,
        name: RouteName.dashboardName,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: RouteName.accountPath,
        name: RouteName.accountName,
        builder: (context, state) => const AccountScreen(),
      ),
      GoRoute(
        path: RouteName.cartPath,
        name: RouteName.cartName,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: RouteName.explorePath,
        name: RouteName.exploreName,
        builder: (context, state) => const ExploreScreen(),
      ),
      GoRoute(
        path: RouteName.favoritePath,
        name: RouteName.favoriteName,
        builder: (context, state) => const FavoriteScreen(),
      ),
      GoRoute(
        path: RouteName.shopPath,
        name: RouteName.shopName,
        builder: (context, state) => const ShopScreen(),
      ),
      GoRoute(
        path: RouteName.productDetailName,
        name: RouteName.productDetailName,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final productId = extra['productId'] as int? ?? 0;
          final isFromDeepLink = extra['isFromDeepLink'] as bool? ?? false;
          return ProductDetailScreen(
            productId: productId,
            isFromDeepLink: isFromDeepLink,
          );
        },
      ),
    ],
  );
}
