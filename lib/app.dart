import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_bloc.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_state.dart';
import 'package:groceries_app/presentation/routes/app_routers.dart';

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleBloc(),
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(414, 896),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'Groceries App UI',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                ),
                routerConfig: appRouter,
                locale: Locale(state.locale),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'), // English
                  Locale('vi'), // Vietnamese
                ],
              );
            },
          );
        },
      ),
    );
  }
}
