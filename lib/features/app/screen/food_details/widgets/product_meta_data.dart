import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:nhom_17/common/widgets/texts/food_price_text.dart';
import 'package:nhom_17/common/widgets/texts/food_title_text.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.food});
  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              radius: 8,
              backgroundColor: Colors.amber.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(food.type ?? '', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
            ),
          ],
        ),
        const SizedBox(height: 6,),
        FoodTitleText(title: food.name, ),
        const SizedBox(height: 6,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const FoodTitleText(title: "Thời gian: ", smallSize: true,),
            const SizedBox(width: 8,),
            FoodPriceText(price: food.time.toString()),
          ],
        ),
        const SizedBox(height: 6,),
      ],
    );
  }
}