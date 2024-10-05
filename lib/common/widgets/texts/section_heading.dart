import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  const SectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'Xem thêm',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle),)
      ],
    );
  }
}
