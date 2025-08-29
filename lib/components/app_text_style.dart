import 'package:flutter/material.dart';
import 'package:groceries_app/contants/app_color_path.dart';

class AppTextStyle {
  static final TextStyle textFont18W600 = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColorPath.black,
  );
  static final TextStyle textFont48W600 = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColorPath.white,
  );
  static final TextStyle textFontI32W800 = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 32,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w800,
    color: AppColorPath.white,
  );
  static final TextStyle textFontI14W500 = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 14,

    fontWeight: FontWeight.w500,
    color: AppColorPath.white,
  );
}
