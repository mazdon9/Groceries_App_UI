import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/contants/app_images_path.dart';
import 'package:groceries_app/presentation/app_imports.dart';
import 'package:groceries_app/presentation/bloc/login/login_bloc.dart';
import 'package:groceries_app/presentation/bloc/login/login_event.dart';
import 'package:groceries_app/presentation/bloc/login/login_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/shared/common_dialogs.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(FailureMapper()),
      child: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isLoading) {
              CommonDialogs.showLoadingDialog(context);
            } else {
              CommonDialogs.hideLoadingDialog(context);
              if (state.apiErrorMessage.isNotEmpty) {
                CommonDialogs.showErrorDialog(
                  context: context,
                  message: state.apiErrorMessage,
                  onTap: () =>
                      context.read<LoginBloc>().add(OnClearLoginErrorMessage()),
                );
              }
              if (state.isSuccess) {
                context.go(RouteName.dashboardPath);
              }
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Center(
                  child: Image.asset(AppImagesPath.logoOrange, height: 48),
                ),
                const SizedBox(height: 100),
                AppText(title: 'Login', style: AppTypography.textFont26W600),
                const SizedBox(height: 8),
                AppText(
                  title: 'Enter your emails and password',
                  style: AppTypography.textFont16W500.copyWith(
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
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return AppTextField(
                      label: 'Password',
                      hint: 'Enter your password',
                      controller: passwordController,
                      obscureText: state.isHidePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.isHidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          context.read<LoginBloc>().add(
                            OnTogglePasswordEvent(),
                          );
                        },
                      ),
                    );
                  },
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
                      context.read<LoginBloc>().add(
                        OnLoginEvent(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                      );
                    },
                    child: AppText(
                      title: 'Log In',
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
                        title: "Don't have an account? ",
                        style: AppTypography.textFont18W600.copyWith(
                          color: AppColorSchemes.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/sign_up');
                        },
                        child: AppText(
                          title: 'Sign up',
                          style: AppTypography.textFont18W600.copyWith(
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
      ),
    );
  }
}
