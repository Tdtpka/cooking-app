import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/texts/food_price_text.dart';
import 'package:nhom_17/common/widgets/texts/food_title_text.dart';
import 'package:nhom_17/features/app/model/recipe_model.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({super.key, required this.recipe, required this.quantity});

  final RecipeModel recipe;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FoodTitleText(title: recipe.name, maxLines: 1, smallSize: true,),
          FoodPriceText(price: quantity.toString(), currencySign: recipe.unit, isLarge: false,),
        ],
      ),
    );
  }
}