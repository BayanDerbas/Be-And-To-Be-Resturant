/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/Animation.json
  String get animation => 'assets/animations/Animation.json';

  /// List of all assets
  List<String> get values => [animation];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cup_drink.png
  AssetGenImage get cupDrink =>
      const AssetGenImage('assets/images/cup_drink.png');

  /// File path: assets/images/donut.png
  AssetGenImage get donut => const AssetGenImage('assets/images/donut.png');

  /// File path: assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/facebook.png');

  /// File path: assets/images/google-map.png
  AssetGenImage get googleMap =>
      const AssetGenImage('assets/images/google-map.png');

  /// File path: assets/images/home.jpg
  AssetGenImage get home => const AssetGenImage('assets/images/home.jpg');

  /// File path: assets/images/instagram.png
  AssetGenImage get instagram =>
      const AssetGenImage('assets/images/instagram.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logoPng => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_.jpg
  AssetGenImage get logoJpg => const AssetGenImage('assets/images/logo_.jpg');

  /// File path: assets/images/logo_header.png
  AssetGenImage get logoHeader =>
      const AssetGenImage('assets/images/logo_header.png');

  /// File path: assets/images/meet.png
  AssetGenImage get meet => const AssetGenImage('assets/images/meet.png');

  /// File path: assets/images/pizza.png
  AssetGenImage get pizza => const AssetGenImage('assets/images/pizza.png');

  /// File path: assets/images/restaurant.png
  AssetGenImage get restaurant =>
      const AssetGenImage('assets/images/restaurant.png');

  /// File path: assets/images/zaatar.png
  AssetGenImage get zaatar => const AssetGenImage('assets/images/zaatar.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    cupDrink,
    donut,
    facebook,
    googleMap,
    home,
    instagram,
    logoPng,
    logoJpg,
    logoHeader,
    meet,
    pizza,
    restaurant,
    zaatar,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
