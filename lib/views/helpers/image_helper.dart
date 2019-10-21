import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ImageType { normal, random, assets }

class ImageHelper {
  static String asset(String name) {
    return 'assets/images/$name';
  }

  static String network(String url) {
    if (url.startsWith('http')) {
      return url;
    }
    return 'http://www.meetingplus.cn/uimg/$url';
  }

  static String randomUrl(String key, {int width = 100, int height = 100}) {
    return 'http://placeimg.com/$width/$height/${key.hashCode}$key';
  }

  static Widget placeholder({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoActivityIndicator(
        radius: min(10.0, width / 3),
      ),
    );
  }

  static error({double width, double height, double size}) {
    return SizedBox(
      width: width,
      height: height,
      child: Icon(
        Icons.error_outline,
        size: size,
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageType imageType;

  const ImageWidget({
    @required this.url,
    @required this.width,
    @required this.height,
    this.fit: BoxFit.cover,
    this.imageType: ImageType.normal,
  });

  get imageUrl {
    switch (imageType) {
      case ImageType.normal:
        return url;
      case ImageType.random:
        return ImageHelper.randomUrl(url,
            width: width.toInt(), height: height.toInt());
      case ImageType.assets:
        return ImageHelper.asset(url);
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (_, __) =>
          ImageHelper.placeholder(width: width, height: height),
      errorWidget: (_, __, ___) =>
          ImageHelper.error(width: width, height: height),
      fit: fit,
    );
  }
}
