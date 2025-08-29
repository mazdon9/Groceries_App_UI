import 'package:flutter/material.dart';
import 'package:groceries_app/components/app_text.dart';
import 'package:groceries_app/components/app_text_style.dart';
import 'package:groceries_app/contants/app_color_path.dart';
import 'package:groceries_app/contants/app_images_path.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPath.green,
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     AppImagesPath.backgroundOnboarding,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 60),
              Image.asset(AppImagesPath.logo, height: 60),
              const SizedBox(height: 24),

              AppText(
                title: 'Welcome\nto our store',
                textAlign: TextAlign.center,
                style: AppTextStyle.textFont48W600,
              ),
              const SizedBox(height: 12),
              AppText(
                title: 'Get your groceries in as fast as one hour',
                textAlign: TextAlign.center,
                style: AppTextStyle.textFontI14W500,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorPath.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: AppText(
                      title: 'Get Started',
                      style: AppTextStyle.textFont18W600.copyWith(
                        color: AppColorPath.white,
                      ),
                    ),
                  ),
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
