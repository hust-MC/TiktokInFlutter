/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetImageGen {
  const $AssetImageGen();

  AssetGenImage get add => const AssetGenImage('asset/image/add.png');
  AssetGenImage get avatar => const AssetGenImage('asset/image/avatar.jpg');
  AssetGenImage get defaultPhoto =>
      const AssetGenImage('asset/image/default_photo.jpg');
  AssetGenImage get edit => const AssetGenImage('asset/image/edit.png');
  AssetGenImage get img => const AssetGenImage('asset/image/img.png');
  AssetGenImage get img1 => const AssetGenImage('asset/image/img_1.png');
  AssetGenImage get lock => const AssetGenImage('asset/image/lock.png');
  AssetGenImage get play => const AssetGenImage('asset/image/play.png');
}

class $AssetVideoGen {
  const $AssetVideoGen();

  String get video1 => 'asset/video/video1.mp4';
  String get video2 => 'asset/video/video2.mp4';
}

class Assets {
  Assets._();

  static const $AssetImageGen image = $AssetImageGen();
  static const $AssetVideoGen video = $AssetVideoGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
