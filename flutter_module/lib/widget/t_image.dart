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
        if (url.contains('asset')) {
          return CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(url),
          );
        } else {
          return CircleAvatar(
            radius: radius,
            backgroundImage: FileImage(File(url)),
          );
        }
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
