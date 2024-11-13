import 'package:flutter/material.dart';

import 'custom_network_image.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    required this.avatarUrl,
  });

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: Clip.antiAlias,
      child: AppImage(
        path: avatarUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
