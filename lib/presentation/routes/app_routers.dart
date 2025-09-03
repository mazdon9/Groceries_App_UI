import 'package:go_router/go_router.dart';
import 'package:groceries_app/presentation/screens/account/account_screen.dart';
import 'package:groceries_app/presentation/screens/cart/cart_screen.dart';
import 'package:groceries_app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:groceries_app/presentation/screens/explore/explore_screen.dart';
import 'package:groceries_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:groceries_app/presentation/screens/login/login_screen.dart';
import 'package:groceries_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/presentation/screens/shop/shop_screen.dart';
import 'package:groceries_app/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:groceries_app/presentation/screens/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/sign_up',
      name: 'sign_up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/account',
      name: 'account',
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/explore',
      name: 'explore',
      builder: (context, state) => const ExploreScreen(),
    ),
    GoRoute(
      path: '/favorite',
      name: 'favorite',
      builder: (context, state) => const FavoriteScreen(),
    ),
    GoRoute(
      path: '/shop',
      name: 'shop',
      builder: (context, state) => const ShopScreen(),
    ),
  ],
);
