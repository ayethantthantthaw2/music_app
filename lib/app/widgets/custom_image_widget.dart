import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../src/app_icons.dart';
import '../src/app_spacings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget(
      {Key? key,
      required this.image,
      this.placeholder = AppIcons.defaultProfileImage,
      this.errorImage,
      this.type = ImageFileType.assets,
      this.height,
      this.width,
      this.size,
      this.color,
      this.fit = BoxFit.cover})
      : super(key: key);

  final String image;
  final String placeholder;
  final String? errorImage;
  final ImageFileType type;
  final BoxFit fit;
  final double? height;
  final double? width;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageFileType.network:
        return CachedNetworkImage(
          imageUrl: image,
          height: size ?? height,
          width: size ?? width,
          fit: fit,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          ),
          placeholder: (context, url) => PlaceHolderImageWidget(
            image: placeholder,
            height: height,
            width: width,
            fit: fit,
          ),
          errorWidget: (context, url, error) {
            return errorImage == null
                ? const Icon(Icons.error)
                : PlaceHolderImageWidget(
                    image: placeholder!,
                    height: height,
                    width: width,
                    fit: fit,
                  );
          },
        );

      case ImageFileType.assets:
        return Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        );
      case ImageFileType.file:
        return Image.file(
          File(
            image,
          ),
          height: height,
          width: width,
          fit: fit,
        );
      case ImageFileType.svg:
        return SvgPicture.asset(
          image,
          height: size ?? height,
          width: size ?? width,
          fit: fit,
          colorFilter:
              color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        );
    }
  }
}

class PlaceHolderImageWidget extends StatelessWidget {
  const PlaceHolderImageWidget(
      {super.key,
      required this.image,
      required this.fit,
      this.height,
      this.width});

  final String image;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.m, vertical: AppSpacing.m),
      child: SvgPicture.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}

class ImageLoaderWidget extends StatelessWidget {
  const ImageLoaderWidget(
    this.loadingProgress, {
    super.key,
  });

  final ImageChunkEvent loadingProgress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}

enum ImageFileType {
  network,
  file,
  assets,
  svg,
}
