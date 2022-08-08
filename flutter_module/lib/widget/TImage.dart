import 'dart:io';

import 'package:flutter/material.dart';

class TImage extends StatelessWidget {
  final String url;
  final fit;
  double? height;
  double? width;

  TImage(this.url, {this.height, this.width, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    print('MCLOG====url: $url');

    if (url.contains('asset')) {
      return Image.asset(url, width: width, height: height, fit: fit);
    } else {
      return Image.file(File(url), width: width, height: height, fit: fit);
    }
  }
}
