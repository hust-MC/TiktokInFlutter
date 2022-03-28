import 'dart:io';

import 'package:flutter/widgets.dart';

class TImage extends StatelessWidget {
  final String url;
  final fit;
  double? height;
  double? width;

  TImage(this.url, {this.fit = BoxFit.cover, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    if (url.contains('asset')) {
      return Image.asset(url, fit: fit, width: width ?? double.infinity, height: height);
    } else {
      return Image.file(File(url), fit: fit, width: width ?? double.infinity, height: height);
    }
  }
}
