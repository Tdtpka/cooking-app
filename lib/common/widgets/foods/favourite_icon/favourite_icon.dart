import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/icons/circular_icon.dart';
import 'package:nhom_17/features/app/controller/food/favourites_controller.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.foodId});
  final String foodId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx((){
      return CircularIcon(
        icon: controller.isFavourite(foodId)? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(foodId) ? Colors.red.shade500 : Colors.black.withOpacity(0.5),
        onPressed: () => controller.toggleFavouriteFood(foodId),
        );
    });
  }
}