import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/foods/food_cards/food_card_vertical.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/features/app/controller/all_foods_controller.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class SortableProducts extends StatelessWidget {

  final List<FoodModel> foods;
  const SortableProducts({
    super.key, required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllFoodsController());
    controller.assignFoods(foods);
    return Column(
      children: [
        DropdownButtonFormField(
          padding: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(10),
          value: controller.selectedSortOption.value,
          onChanged: (value){
            controller.sortFoods(value!);
          },
          decoration: const InputDecoration(icon: Icon(Iconsax.sort),
          border: UnderlineInputBorder(borderSide: BorderSide.none)
          ),
          items: [
            "Name","Fast cook","Slow cook","Diet"
          ].map((option)=> DropdownMenuItem(value: option, child: Text(option))).toList(),
        ),
        const SizedBox(height: 32,),
    
        Obx((){
          return GridLayout(
            itemCount: controller.foods.length,
            itemBuilder: (_, index){
              return FoodCardVertical(food: controller.foods[index],);
            },
          );
        })
      ],
    );
  }
}