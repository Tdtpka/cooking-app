import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:nhom_17/common/widgets/foods/favourite_icon/favourite_icon.dart';
import 'package:nhom_17/common/widgets/images/rounded_image.dart';
import 'package:nhom_17/common/widgets/texts/food_price_text.dart';
import 'package:nhom_17/common/widgets/texts/food_title_text.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class FoodCardHorizontal extends StatelessWidget {
  const FoodCardHorizontal({super.key, required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(4),
            backgroundColor: Colors.white,
            child: Stack(
              children: [
                SizedBox(width: 120, height: 120, child: RoundedImage(imageUrl: food.thumbnail, isNetworkImage: true, applyImageRadius: true,backgroundColor: Colors.grey.shade100,)),
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
                  child: FavouriteIcon(foodId: food.id,)
                ) 
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodTitleText(title: food.name, smallSize: false,),
                      SizedBox(height: 2,),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: FoodPriceText(price: food.time.toString()),
                        )
                      ),
                      Positioned(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(16)),
                          ),
                          child: const SizedBox(
                            width: 32*1.2,
                            height: 32*1.2,
                            child: Center(child: Icon(Iconsax.add, color: Colors.white,)
                            )
                          )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}