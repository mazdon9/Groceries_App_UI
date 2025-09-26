import 'package:chottu_link/chottu_link.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/di/env_module.dart';
import 'package:groceries_app/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ✅ Initialize the ChottuLink SDK
  /// Make sure to call this before using any ChottuLink features.
  await ChottuLink.init(apiKey: "c_app_Zk6XFXcePKoXUKHL3FnXhv3AwpBlz9AT");

  await configureDependencies(env: dev.name);
  runApp(const GroceriesApp());
}
