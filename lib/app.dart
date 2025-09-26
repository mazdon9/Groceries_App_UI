import 'package:chottu_link/chottu_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_bloc.dart';
import 'package:groceries_app/presentation/bloc/locale/locale_state.dart';
import 'package:groceries_app/presentation/routes/app_routers.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';

class GroceriesApp extends StatefulWidget {
  const GroceriesApp({super.key});

  @override
  State<GroceriesApp> createState() => _GroceriesAppState();
}

class _GroceriesAppState extends State<GroceriesApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();

    /// 🔗 Listen for incoming dynamic links
    ChottuLink.onLinkReceived.listen((String link) {
      debugPrint(" ✅ Link Received: $link");
      // "https://onlinegrocerystore.chottu.link/product/${widget.productId}"

      /// handle navigation to the product detail page
      if (mounted) {
        try {
          final hasProductId = link.contains("product/");
          if (hasProductId) {
            final productId = link.split("product/")[1];
            context.pushNamed(
              RouteName.productDetailName,
              extra: {
                'productId': int.parse(productId),
                'isFromDeepLink': true,
              },
            );
          }
        } catch (e, stackTrace) {
          debugPrint("❌ Error: $e");
          debugPrint("❌ Stack Trace: $stackTrace");
        }
      }
    });
  }

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
