import 'package:groceries_app/core/env/flavor.dart';

class AppConfig {
  AppConfig({required this.flavor, required this.baseUrl});

  final Flavor flavor;
  final String baseUrl;
}
