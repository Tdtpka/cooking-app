import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/icons/circular_icon.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/controller/grocery/grocery_list_controller.dart';
import 'package:nhom_17/features/app/model/food_model.dart';
import 'package:nhom_17/features/app/screen/cooking/cooking_screen.dart';
import 'package:nhom_17/features/app/screen/food_details/widgets/food_attributes.dart';
import 'package:nhom_17/features/app/screen/food_details/widgets/food_image_slider.dart';
import 'package:nhom_17/features/app/screen/food_details/widgets/food_recipe.dart';
import 'package:nhom_17/features/app/screen/food_details/widgets/product_meta_data.dart';
import 'package:nhom_17/features/app/screen/food_details/widgets/rating_and_share.dart';
import 'package:nhom_17/features/app/screen/product_reviews/product_reviews.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final diet = 1.obs;
    final controller = GroceryController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(food: food,),
            Padding(padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RatingAndShare(),
                ProductMetaData(food: food,),
                ProductAttributes(food :food),
                const SizedBox(height: 8,),
                const SizedBox(height: 8,),
                const SectionHeading(title: "Mô tả", showActionButton: false,),
                const SizedBox(height: 4,),
                const SizedBox(height: 8,),
                ReadMoreText(
                  food.description?? "",
                  textAlign: TextAlign.left,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Hiện thêm",
                  trimExpandedText: "Ẩn bớt",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const Divider(color: Colors.amber,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHeading(title: "Review(199)", showActionButton: false,),
                    IconButton(
                      onPressed: ()=> Get.to(()=>const ProductReviewsScreen()),
                      icon: const Icon(Iconsax.arrow_right_34, size: 18,)
                    ),
                  ],
                ),
                const Divider(color: Colors.amber,),
                const SizedBox(height: 8,),
                Text("Nguyên liệu", style: TextStyle(fontSize: 25, color: Colors.orange.shade800,),),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Số người"),
                    const SizedBox(width: 8,),
                    GestureDetector(
                      onTap: () {
                        if(diet.value > 1) diet.value--;
                      },
                      child: CircularIcon(
                        icon: Iconsax.minus,
                        size: 13,
                        backgroundColor: Colors.amber.shade100,
                        width: 28,
                        height: 28,
                        color: Colors.orange.shade800,
                      ),
                    ),
                    const SizedBox(width: 3,),
                    Obx(() => Text(
                      diet.value.toString(),
                      style: Theme.of(context).textTheme.titleSmall!.apply(color: Colors.black),)
                    ),
                    const SizedBox(width: 3,),
                    GestureDetector(
                      onTap: () {
                        diet.value ++;
                      },
                      child: CircularIcon(
                        icon: Iconsax.add,
                        size: 13,
                        backgroundColor: Colors.orange.shade500,
                        width: 28,
                        height: 28,
                        color: Colors.amber.shade100,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        if(diet.value != 0){
                          final recipes = food.recipes.keys.toList();
                          final quantity = food.recipes.values.toList();
                          for(int i = 0; i < recipes.length; i++){
                            controller.addRecipe(recipeId: recipes[i], quantity: quantity[i] * diet.value);
                          }
                          Get.snackbar("", "Tất cả nguyên liệu đã được thêm!", duration: Duration(milliseconds: 800));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.amber.shade100,
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: const Text("Thêm tất cả"),
                    ),
                  ],
                ),
                FoodRecipe(food: food, diet: diet),
              ],
            ),),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          maximumSize: Size(170, 70),
          minimumSize: Size(170, 55),
          backgroundColor: Colors.amber.shade600,
          foregroundColor: Colors.white,
        ),
        onPressed: ()=> Get.to(()=> CookingScreen(food: food,)),
        child: Text("Bắt đầu nấu <3", style: TextStyle(fontSize: 15)
        )
      )
    );
  }
}
