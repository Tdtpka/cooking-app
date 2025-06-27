import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/features/app/controller/recipe/recipe_controller.dart';
import 'package:nhom_17/features/app/screen/recipe/recipe_screen.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
    this.hoverColor,
  });
  final Color? hoverColor;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecipeController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(()=> const RecipeScreen()),
          icon: Icon(Iconsax.shopping_bag, color: iconColor,),
          hoverColor: hoverColor,
        ),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Obx(()=> Text(controller.groceryList.length.toString(), style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white, fontSizeFactor: 0.75),)),
          ),
        )
      ],
    );
  }
}
