import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/app_imports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
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
              AppText(title: 'Sign Up', style: AppTypography.textFont26W600),
              const SizedBox(height: 8),
              AppText(
                title: 'Enter your credentials to continue',
                style: AppTypography.textFont16W500.copyWith(
                  color: AppColorSchemes.grey,
                ),
              ),
              const SizedBox(height: 32),
              AppTextField(
                label: 'Username',
                hint: 'Enter your username',
                controller: usernameController,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Email',
                hint: 'Enter your email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icon(Icons.check, color: AppColorSchemes.green),
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
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'By continuing you agree to our ',
                  style: AppTypography.textFont14W500.copyWith(
                    color: AppColorSchemes.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: AppTypography.textFont14W500.copyWith(
                        color: AppColorSchemes.green,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: AppTypography.textFont14W500.copyWith(
                        color: AppColorSchemes.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: AppTypography.textFont14W500.copyWith(
                        color: AppColorSchemes.green,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
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
                  onPressed: () {},
                  child: AppText(
                    title: 'Sing Up',
                    style: AppTypography.textFont18W600.copyWith(
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
                      title: "Already have an account? ",
                      style: TextStyle(color: AppColorSchemes.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: AppText(
                        title: 'Login',
                        style: AppTypography.textFont14W500.copyWith(
                          color: AppColorSchemes.green,
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
