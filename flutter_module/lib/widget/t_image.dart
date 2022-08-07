// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

class TImage extends StatelessWidget {
  final String url;
  final fit;
  final shape;
  double? height;
  double? width;
  double? radius;

  TImage(this.url, {this.fit = BoxFit.cover, this.shape = Shape.NORMAL, this.width, this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    switch (shape) {
      case Shape.NORMAL:
        if (url.contains('asset')) {
          return Image.asset(url, fit: fit, width: width, height: height);
        } else {
          return Image.file(File(url), fit: fit, width: width, height: height);
        }
      case Shape.CIRCLE:
        var backgroundImage;
        if (url.contains('asset')) {
          backgroundImage = AssetImage(url);
        } else {
          backgroundImage = FileImage(File(url));
        }
        return Container(
          width: radius != null ? radius! * 2 + 8: null,
          height: radius != null ? radius! * 2 + 8: null,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Color(0xfffefdfd),
              width: 4,
            ),
          ),
        );
      default:
        if (url.contains('asset')) {
          return Image.asset(url, fit: fit, width: width ?? double.infinity, height: height);
        } else {
          return Image.file(File(url), fit: fit, width: width ?? double.infinity, height: height);
        }
    }
  }
}

enum Shape { NORMAL, CIRCLE }
