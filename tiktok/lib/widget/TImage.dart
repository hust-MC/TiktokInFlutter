import 'dart:io';

import 'package:flutter/widgets.dart';

class TImage extends StatelessWidget {
  final String url;
  final fit;

  TImage(this.url, {this.fit});

  @override
  Widget build(BuildContext context) {
    if (url.contains('asset')) {
      return Image.asset(url, fit: fit);
    } else {
      return Image.file(File(url), fit: fit);
    }
  }
}
