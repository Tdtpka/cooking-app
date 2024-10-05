import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = false,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });
  final EdgeInsetsGeometry padding;
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: showBackground ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 2, color: showBorder? Colors.orange.shade500: Colors.transparent),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.orange,),
              const SizedBox(width: 20,),
              Text(text, style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.orange))
            ],
          ),
        ),
      ),
    );
  }
}
