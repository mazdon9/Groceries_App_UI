import 'package:groceries_app/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static final String splashScreenRouter = 'splash-screen';
  static final String onboardingScreenRouter = 'onboarding-screen';

  static final routes = {
    splashScreenRouter: (context) => SplashScreen(),
    onboardingScreenRouter: (context) => OnboardingScreen(),
  };
}
