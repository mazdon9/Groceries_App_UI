// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Gilroy Bold.otf
  String get gilroyBold => 'assets/fonts/Gilroy Bold.otf';

  /// File path: assets/fonts/Gilroy Italic.otf
  String get gilroyItalic => 'assets/fonts/Gilroy Italic.otf';

  /// File path: assets/fonts/Gilroy Medium.otf
  String get gilroyMedium => 'assets/fonts/Gilroy Medium.otf';

  /// File path: assets/fonts/Gilroy Regular.otf
  String get gilroyRegular => 'assets/fonts/Gilroy Regular.otf';

  /// File path: assets/fonts/SGilroy SemiBold.otf
  String get sGilroySemiBold => 'assets/fonts/SGilroy SemiBold.otf';

  /// List of all assets
  List<String> get values => [
    gilroyBold,
    gilroyItalic,
    gilroyMedium,
    gilroyRegular,
    sGilroySemiBold,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/about_icon.png
  AssetGenImage get aboutIcon =>
      const AssetGenImage('assets/icons/about_icon.png');

  /// File path: assets/icons/account_icon.png
  AssetGenImage get accountIcon =>
      const AssetGenImage('assets/icons/account_icon.png');

  /// File path: assets/icons/bell_icon.png
  AssetGenImage get bellIcon =>
      const AssetGenImage('assets/icons/bell_icon.png');

  /// File path: assets/icons/cart_icon.png
  AssetGenImage get cartIcon =>
      const AssetGenImage('assets/icons/cart_icon.png');

  /// File path: assets/icons/details_icon.png
  AssetGenImage get detailsIcon =>
      const AssetGenImage('assets/icons/details_icon.png');

  /// File path: assets/icons/edit_icon.png
  AssetGenImage get editIcon =>
      const AssetGenImage('assets/icons/edit_icon.png');

  /// File path: assets/icons/explore_icon.png
  AssetGenImage get exploreIcon =>
      const AssetGenImage('assets/icons/explore_icon.png');

  /// File path: assets/icons/favorite_icon.png
  AssetGenImage get favoriteIcon =>
      const AssetGenImage('assets/icons/favorite_icon.png');

  /// File path: assets/icons/help_icon.png
  AssetGenImage get helpIcon =>
      const AssetGenImage('assets/icons/help_icon.png');

  /// File path: assets/icons/location_icon.png
  AssetGenImage get locationIcon =>
      const AssetGenImage('assets/icons/location_icon.png');

  /// File path: assets/icons/logout_icon.png
  AssetGenImage get logoutIcon =>
      const AssetGenImage('assets/icons/logout_icon.png');

  /// File path: assets/icons/orders_icon.png
  AssetGenImage get ordersIcon =>
      const AssetGenImage('assets/icons/orders_icon.png');

  /// File path: assets/icons/payment_icon.png
  AssetGenImage get paymentIcon =>
      const AssetGenImage('assets/icons/payment_icon.png');

  /// File path: assets/icons/promo_icon.png
  AssetGenImage get promoIcon =>
      const AssetGenImage('assets/icons/promo_icon.png');

  /// File path: assets/icons/shop_icon.png
  AssetGenImage get shopIcon =>
      const AssetGenImage('assets/icons/shop_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    aboutIcon,
    accountIcon,
    bellIcon,
    cartIcon,
    detailsIcon,
    editIcon,
    exploreIcon,
    favoriteIcon,
    helpIcon,
    locationIcon,
    logoutIcon,
    ordersIcon,
    paymentIcon,
    promoIcon,
    shopIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar_images.png
  AssetGenImage get avatarImages =>
      const AssetGenImage('assets/images/avatar_images.png');

  /// File path: assets/images/backgound_onboarding_image.png
  AssetGenImage get backgoundOnboardingImage =>
      const AssetGenImage('assets/images/backgound_onboarding_image.png');

  /// File path: assets/images/background_onboarding_images.png
  AssetGenImage get backgroundOnboardingImages =>
      const AssetGenImage('assets/images/background_onboarding_images.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_orange.png
  AssetGenImage get logoOrange =>
      const AssetGenImage('assets/images/logo_orange.png');

  /// File path: assets/images/logo_text.png
  AssetGenImage get logoText =>
      const AssetGenImage('assets/images/logo_text.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    avatarImages,
    backgoundOnboardingImage,
    backgroundOnboardingImages,
    logo,
    logoOrange,
    logoText,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
