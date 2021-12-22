import 'package:flutter/material.dart';

class ImageLoaderWidget extends StatelessWidget {
  const ImageLoaderWidget({Key? key, this.height = 300, this.width = 300, required this.child, required this.loadingProgress}) : super(key: key);

  final ImageChunkEvent? loadingProgress;
  final double height, width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: loadingProgress != null
          ? CircularProgressIndicator(
              value: loadProgress(loadingProgress!),
            )
          : child,
    );
  }

  double? loadProgress(ImageChunkEvent loadingProgress) {
    var downloaded = loadingProgress.cumulativeBytesLoaded;
    var total = loadingProgress.expectedTotalBytes;

    return total == null
        ? null
        : total == 0
            ? 0
            : downloaded / total;
  }
}
