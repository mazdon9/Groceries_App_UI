import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/components/app_text_style.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_field.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Center(child: Image.asset(AppImagesPath.logoOrange, height: 48)),
              const SizedBox(height: 100),
              AppText(title: 'Login', style: AppTextStyle.textFont26W600),
              const SizedBox(height: 8),
              AppText(
                title: 'Enter your emails and password',
                style: AppTextStyle.textFont16W500.copyWith(
                  color: AppColorSchemes.grey,
                ),
              ),
              const SizedBox(height: 32),
              AppTextField(
                label: 'Email',
                hint: 'Enter your email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: passwordController,
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: AppText(
                    title: 'Forgot Password?',
                    style: TextStyle(color: AppColorSchemes.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorSchemes.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    context.go('/dashboard');
                  },
                  child: AppText(
                    title: 'Log In',
                    style: AppTextStyle.textFont18W600.copyWith(
                      color: AppColorSchemes.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: "Don't have an account? ",
                      style: AppTextStyle.textFont18W600.copyWith(
                        color: AppColorSchemes.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/sign_up');
                      },
                      child: AppText(
                        title: 'Sign up',
                        style: AppTextStyle.textFont18W600.copyWith(
                          color: AppColorSchemes.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
