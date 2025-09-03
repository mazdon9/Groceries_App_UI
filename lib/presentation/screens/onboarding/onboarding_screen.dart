import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/core/extentions/context_extentions.dart';
import 'package:groceries_app/data/datasources/local/local_storage.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.darkBlue,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgound_onboarding_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 60),
              Image.asset(AppImagesPath.logo, height: 60),
              const SizedBox(height: 24),

              AppText(
                title: 'Welcome\nto our store',
                textAlign: TextAlign.center,
                style: AppTypography.textFont48W600,
              ),
              const SizedBox(height: 12),
              AppText(
                title: 'Get your groceries in as fast as one hour',
                textAlign: TextAlign.center,
                style: AppTypography.textFontI14W500,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: AppButton(
                  content: 'Get Started',
                  width: (353 / 414) * context.screenWidth,

                  onTap: () async {
                    // Lưu trạng thái onboarding đã hoàn thành
                    await getIt<LocalStorage>().setOnboardingCompleted();
                    context.go('/login');
                  },
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ],
      ),
    );
  }
}
