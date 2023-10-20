/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  $AssetsImageAnimationsGen get animations => const $AssetsImageAnimationsGen();
  $AssetsImageIconsGen get icons => const $AssetsImageIconsGen();

  /// File path: assets/image/logo_owlet.svg
  SvgGenImage get logoOwlet => const SvgGenImage('assets/image/logo_owlet.svg');

  /// File path: assets/image/logo_owlet_icon.png
  AssetGenImage get logoOwletIcon =>
      const AssetGenImage('assets/image/logo_owlet_icon.png');

  /// File path: assets/image/logo_owlet_text.svg
  SvgGenImage get logoOwletText =>
      const SvgGenImage('assets/image/logo_owlet_text.svg');

  /// List of all assets
  List<dynamic> get values => [logoOwlet, logoOwletIcon, logoOwletText];
}

class $AssetsImageAnimationsGen {
  const $AssetsImageAnimationsGen();

  /// File path: assets/image/animations/success_animations.json
  LottieGenImage get successAnimations =>
      const LottieGenImage('assets/image/animations/success_animations.json');

  /// List of all assets
  List<LottieGenImage> get values => [successAnimations];
}

class $AssetsImageIconsGen {
  const $AssetsImageIconsGen();

  /// File path: assets/image/icons/ic3d_add_wallet.webp
  AssetGenImage get ic3dAddWallet =>
      const AssetGenImage('assets/image/icons/ic3d_add_wallet.webp');

  /// File path: assets/image/icons/ic3d_loan.png
  AssetGenImage get ic3dLoan =>
      const AssetGenImage('assets/image/icons/ic3d_loan.png');

  /// File path: assets/image/icons/ic3d_money.png
  AssetGenImage get ic3dMoney =>
      const AssetGenImage('assets/image/icons/ic3d_money.png');

  /// File path: assets/image/icons/ic3d_piggy_bank.png
  AssetGenImage get ic3dPiggyBank =>
      const AssetGenImage('assets/image/icons/ic3d_piggy_bank.png');

  /// File path: assets/image/icons/ic3d_shopping.png
  AssetGenImage get ic3dShopping =>
      const AssetGenImage('assets/image/icons/ic3d_shopping.png');

  /// File path: assets/image/icons/ic3d_wallet.png
  AssetGenImage get ic3dWallet =>
      const AssetGenImage('assets/image/icons/ic3d_wallet.png');

  /// File path: assets/image/icons/ic3d_wallet_manager.png
  AssetGenImage get ic3dWalletManager =>
      const AssetGenImage('assets/image/icons/ic3d_wallet_manager.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ic3dAddWallet,
        ic3dLoan,
        ic3dMoney,
        ic3dPiggyBank,
        ic3dShopping,
        ic3dWallet,
        ic3dWalletManager
      ];
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
