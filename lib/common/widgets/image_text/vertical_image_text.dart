import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/images/circular_image.dart';

class VerticalImageText extends StatelessWidget {
  
  final Color textColor;
  final String image, title;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircularImage(
              fit: BoxFit.fitWidth,
              padding: 12,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              image: image,
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}