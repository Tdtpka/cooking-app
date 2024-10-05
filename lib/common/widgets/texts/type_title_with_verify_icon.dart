import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/texts/type_title_text.dart';

class TypeTitleWithVerifiedIcon extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final String typeTextSize;

  const TypeTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = Colors.amber,
    this.textAlign = TextAlign.center,
    this.typeTextSize = "small",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TypeTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            typeTextSize: typeTextSize,
          )
        ),
        const SizedBox(width: 4,),
        Icon(Iconsax.verify5, color: iconColor, size: 20,)
      ],
    );
  }
}
