import 'package:groceries_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/presentation/screens/splash/splash_screen.dart';

/// TODO: config route accroding to go_router with navigation 2.0
class AppRoutes {
  static final String splashScreenRouter = 'splash-screen';
  static final String onboardingScreenRouter = 'onboarding-screen';

  static final routes = {
    splashScreenRouter: (context) => SplashScreen(),
    onboardingScreenRouter: (context) => OnboardingScreen(),
  };
}
