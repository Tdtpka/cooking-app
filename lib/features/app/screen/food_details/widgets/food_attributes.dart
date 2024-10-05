import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:nhom_17/common/widgets/texts/food_title_text.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.food});
  final FoodModel food;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8,),
        RoundedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          backgroundColor: Colors.amber.shade200,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 8,),
                  const SectionHeading(title: "Thông tin:", showActionButton: false,),
                  const SizedBox(width: 18,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const FoodTitleText(title: "Calories :", smallSize: true,),
                          const SizedBox(width: 8,),
                          Text("${food.calories} kcal", style: Theme.of(context).textTheme.titleSmall,),
                        ],
                      ),
                      Row(
                        children: [
                          FoodTitleText(title: "Phù hợp :", smallSize: true,),
                          const SizedBox(width: 8,),
                          Text(food.type ?? '', style: Theme.of(context).textTheme.titleSmall,)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8,),
      ],
    );
  }
}