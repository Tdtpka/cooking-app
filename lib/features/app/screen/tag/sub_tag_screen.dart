import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/foods/food_cards/food_card_horizontal.dart';
import 'package:nhom_17/common/widgets/images/rounded_image.dart';
import 'package:nhom_17/common/widgets/shimmers/horizontal_foods_shimmer.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/controller/tag_controller.dart';
import 'package:nhom_17/features/app/model/tag_model.dart';
import 'package:nhom_17/features/app/screen/all_foods/all_foods.dart';

class SubTagScreen extends StatelessWidget {
  const SubTagScreen({super.key, required this.tag});

  final TagModel tag;

  @override
  Widget build(BuildContext context) {
    final controller = TagController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text(tag.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              RoundedImage(imageUrl: tag.image,isNetworkImage: true, width: double.infinity, height: 180,applyImageRadius: true,),
              const SizedBox(height: 20,),

              FutureBuilder(
                future: controller.getSubTags(tag.id),
                builder: (context, snapshot) {

                  const loader = HorizontalFoodsShimmer();
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return loader;
                  }
                  if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                    return const Center(child: Text("No data found!"),);
                  }
                  if(snapshot.hasError){
                    return const Center(child: Text("Something went wrong.."),);
                  }
                  final subTags = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subTags.length,
                    physics:const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index){

                      final subTag = subTags[index];
                      
                      return FutureBuilder(
                        future: controller.getTagFoods(tagId: subTag.id),
                        builder: (context, snapshot) {
                          const loader = HorizontalFoodsShimmer();
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
                                title: subTag.name,
                                onPressed: ()=> Get.to(()=>
                                  AllFoods(
                                    title: subTag.name,
                                    futureMethod: controller.getTagFoods(
                                      tagId: subTag.id,
                                      limit: -1
                                    ),
                                  )
                                ),
                              ),
                              const SizedBox(height: 16,),
                              
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: foods.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) => const SizedBox(width: 4,),
                                  itemBuilder: (context, index) => FoodCardHorizontal(food: foods[index]),
                                ),
                              ),
                              const SizedBox(height: 12,),
                            ],
                          );
                        }
                      );
                    }
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}