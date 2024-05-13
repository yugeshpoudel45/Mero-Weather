import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  const AppNetworkImage({
    Key? key,
    required this.image,
    this.width = 40,
    this.height = 80,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      height: height,
      width: width,
      imageUrl: "https:$image",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) {
        log("Error loading image: $error");
        return const Center(
          child: Icon(Icons.error),
        );
      },
    );
  }
}
