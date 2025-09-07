import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
import 'package:groceries_app/data/datasources/local/local_storage.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      // Make sure LocalStorage is initialized
      final completed = await getIt<LocalStorage>().getOnboardingCompleted();
      if (mounted) {
        if (completed) {
          context.go(RouteName.loginPath);
        } else {
          context.go(RouteName.onboardingPath);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: (55 / 414) * context.screenWidth,
                height: (64 / 896) * context.screenHeight,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo_text.png',
                    width: (195 / 414) * context.screenWidth,
                    height: (46 / 896) * context.screenHeight,
                  ),
                  SizedBox(height: 5),
                  AppText(
                    title: 'online groceriet',
                    style: AppTypography.textFontI14W500.copyWith(
                      color: AppColorSchemes.white,
                      letterSpacing: 4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
