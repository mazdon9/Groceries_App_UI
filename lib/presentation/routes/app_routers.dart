import 'package:go_router/go_router.dart';
import 'package:groceries_app/presentation/screens/login/login_screen.dart';
import 'package:groceries_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/presentation/screens/sign_in/sign_in_screen.dart';
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
      path: '/sign_in',
      name: 'sign_in',
      builder: (context, state) => const SignInScreen(),
    ),
  ],
);
