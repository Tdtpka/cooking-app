import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';

class CircularImage extends StatelessWidget{
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = 4,
    this.isNetworkImage = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor?? Colors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
          ?CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerEffect(width: 55, height: 55),
            errorWidget: (context, url, error) => const Icon(Icons.error_outline),
          )
          :Image(
            fit: fit,
            image: AssetImage("images/avatar_default.jpg"),
          ),
        ),
      ),
    );
  }
  
}