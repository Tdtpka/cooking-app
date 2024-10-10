import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/styles/shadows.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:nhom_17/common/widgets/foods/favourite_icon/favourite_icon.dart';
import 'package:nhom_17/common/widgets/images/rounded_image.dart';
import 'package:nhom_17/common/widgets/texts/food_price_text.dart';
import 'package:nhom_17/common/widgets/texts/food_title_text.dart';
import 'package:nhom_17/features/app/controller/grocery/grocery_list_controller.dart';
import 'package:nhom_17/features/app/model/food_model.dart';
import 'package:nhom_17/features/app/screen/food_details/food_detail_screen.dart';

class FoodCardVertical extends StatelessWidget {
  const FoodCardVertical({super.key, required this.food,});
  
  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final controller = GroceryController.instance;
    return GestureDetector(
      onTap: () => Get.to(()=> ProductDetailScreen(food: food,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalFoodShadow],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  RoundedImage(imageUrl: food.thumbnail, applyImageRadius: true, isNetworkImage: true,),
                  Positioned(
                    top: 0,
                    child: RoundedContainer(
                      radius: 10,
                      backgroundColor: Colors.amber.withOpacity(0.85),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(food.type!, style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: FavouriteIcon(foodId: food.id,)
                      )
                  ) 
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodTitleText(title: food.name),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: FoodPriceText(price: food.time.toString(), isLarge: true,),
                  ),
                  GestureDetector(
                    onTap: (){
                      final recipes = food.recipes.keys.toList();
                      final quantity = food.recipes.values.toList();
                      for( int i = 0; i<recipes.length; i++){
                        controller.addRecipe(recipeId: recipes[i], quantity: quantity[i]);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(16)),
                      ),
                      child: const SizedBox(
                        width: 32*1.2,
                        height: 32*1.2,
                        child: Center(child: Icon(Iconsax.add, color: Colors.white,))
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
