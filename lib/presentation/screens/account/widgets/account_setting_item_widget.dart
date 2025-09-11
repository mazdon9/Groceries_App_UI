import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_bloc.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_event.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_state.dart';
import 'package:groceries_app/presentation/bloc/login/login_event.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';
import 'package:groceries_app/presentation/theme/app_typography.dart';

class AccountSettingItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  final bool hasSwitchButton;
  const AccountSettingItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.hasSwitchButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: (58 / 896) * context.screenHeight,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColorSchemes.black.withAlpha(70)),
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
              color: AppColorSchemes.black,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTypography.textFont18W600.copyWith(
                  color: AppColorSchemes.black,
                ),
              ),
            ),

            if (!hasSwitchButton)
              Icon(
                Icons.arrow_forward_ios,
                color: AppColorSchemes.grey,
                size: 16,
              ),
            if (hasSwitchButton)
              BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 40,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                        value: state.locale == 'en',
                        onChanged: (bool value) {
                          context.read<LocaleBloc>().add(
                            OnChangeLocaleEvent(locale: value ? 'en' : 'vi'),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
