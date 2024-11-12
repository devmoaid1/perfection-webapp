import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../app_icons.dart';

class AppImage extends StatelessWidget {
  final BoxFit? fit;
  final String? path;
  final double? height;
  final double? width;
  final Widget? placeHolder;

  const AppImage(
      {super.key,
      this.fit = BoxFit.cover,
      this.height,
      this.width,
      this.placeHolder,
      this.path = ""});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path ?? '',
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) =>
          const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Image.asset(
        Assets.assetsIconsLogo,
        fit: BoxFit.contain,
      ),
    );
  }
}
