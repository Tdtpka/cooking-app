import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/images/circular_image.dart';
import 'package:nhom_17/common/widgets/shimmers/horizontal_foods_shimmer.dart';
import 'package:nhom_17/features/app/controller/food/food_controller.dart';
import 'package:nhom_17/features/app/controller/recipe/recipe_controller.dart';
import 'package:nhom_17/features/app/model/food_model.dart';
import 'package:nhom_17/features/app/screen/food_details/widgets/recipe_tile.dart';

class FoodRecipe extends StatelessWidget {
  const FoodRecipe({super.key, required this.food, required this.diet});
  
  final FoodModel food;
  final RxInt diet;

  @override
  Widget build(BuildContext context){
    final controller = FoodController.instance;
    final groceryController = RecipeController.instance;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: controller.fetchRecipesOfFood(food.recipes),
              builder: (context, snapshot){
                const loader = HorizontalFoodsShimmer();
                if(snapshot.connectionState == ConnectionState.waiting){
                  return loader;
                }
                if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                  return const Center(child: Text("Không tìm thấy dữ liệu!"),);
                }
                if(snapshot.hasError){
                  return const Center(child: Text("Something went wrong.."),);
                }
                final data = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) => 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      children: [
                        CircularImage(image: data[index].image ?? '',isNetworkImage: true,),
                        SizedBox(width: 15,),
                        Obx(() =>
                          Expanded(
                            flex: 4,
                            child: RecipeTile(
                              recipe: data[index],
                              quantity: food.recipes[data[index].id] * diet.value
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextButton.icon(
                          onPressed: (){
                            groceryController.addRecipe(recipeId: data[index].id, quantity: food.recipes[data[index].id] * diet.value);
                            Get.snackbar("", "Đã thêm ${data[index].name} vào giỏ", duration: const Duration(milliseconds: 1000), borderRadius: 50);
                          },
                          label: Text("Thêm vào giỏ", style: TextStyle(fontSize: 12),),
                          icon: Icon(Iconsax.add),
                        ))
                      ],
                    ),
                  )
                );
              }
            )
          ],
        ),
        
      ),
    );
  }
}