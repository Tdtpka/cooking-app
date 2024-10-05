import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/shimmers/vertical_foods_shimmer.dart';
import 'package:nhom_17/common/widgets/foods/food_cards/food_card_vertical.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/controller/tag_controller.dart';
import 'package:nhom_17/features/app/model/tag_model.dart';
import 'package:nhom_17/features/app/screen/all_foods/all_foods.dart';
import 'package:nhom_17/features/app/screen/store/widgets/tag_types.dart';

class TagTab extends StatelessWidget {

  final TagModel tag; 
  const TagTab({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final controller = TagController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TagTypes(tag: tag),
            const SizedBox(height: 8,),
            FutureBuilder(
              future: controller.getTagFoods(tagId: tag.id),
              builder: (context, snapshot) {
                const loader = VerticalFoodsShimmer();
                if(snapshot.connectionState == ConnectionState.waiting){
                  return loader;
                }
                if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                  return const Center(child: Text("No data found!"),);
                }
                if(snapshot.hasError){
                  return const Center(child: Text("Something went wrong.."),);
                }
                final foods = snapshot.data!;
                return Column(
                  children: [
                    SectionHeading(
                      title: "Bạn có thể thích",
                      showActionButton: true,
                      onPressed: ()
                      =>Get.to((
                          AllFoods(
                            title: tag.name,
                            futureMethod: controller.getTagFoods(tagId: tag.id, limit: -1),
                          )
                        )),
                    ),

                    const SizedBox(height: 8,),
                      
                    GridLayout(
                      itemCount: foods.length,
                      itemBuilder: (_, index) => FoodCardVertical(food: foods[index],)
                    ),
                  ],
                );
              }
            ),
            
          ],
        ),
      ),
      ]
    );
  }
}