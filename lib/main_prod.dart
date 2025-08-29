import 'package:flutter/material.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/di/env_module.dart';
import 'package:groceries_app/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(env: prod.name);
  runApp(const GroceriesApp());
}
