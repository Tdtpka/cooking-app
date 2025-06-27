import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/images/rounded_image.dart';
import 'package:nhom_17/common/widgets/texts/food_price_text.dart';
import 'package:nhom_17/common/widgets/texts/food_title_text.dart';
import 'package:nhom_17/features/app/controller/recipe/recipe_controller.dart';
import 'package:nhom_17/features/app/model/recipe_model.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.item,
    required this.quantity,
    required this.isBought,
  });
  final RecipeModel item;
  final int quantity;
  final RxBool isBought;

  @override
  Widget build(BuildContext context) {
    final controller = RecipeController.instance;
    return Row(
      children: [
        RoundedImage(
          imageUrl: item.image ?? '',
          isNetworkImage: true,
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(4),
          backgroundColor: Colors.white,
          borderRadius: 30,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Flexible(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FoodTitleText(
                              title: item.name,
                              maxLines: 1,
                              lineThrough: isBought.value,
                              smallSize: true,
                            ),
                            FoodPriceText(
                              price: quantity.toString(),
                              currencySign: item.unit,
                              lineThrough: isBought.value,
                              isLarge: false,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                            value: isBought.value,
                            onChanged: (val) {
                              isBought.value = val!;
                              controller.clickBought(item.id, isBought.value);
                            }),
                      ),
                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              controller.removeRecipe(item.id);
                            },
                        child: Icon(
                          Iconsax.trash,
                          color: Colors.red,
                        ),
                      ))
                    ],
                  ))),
            ],
          ),
        )
      ],
    );
  }
}
