import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/routes/app_routers.dart';

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Groceries App UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter,
    );
  }
}
