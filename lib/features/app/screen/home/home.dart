import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/search_container.dart';
import 'package:nhom_17/common/widgets/foods/food_cards/food_card_vertical.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/common/widgets/shimmers/vertical_foods_shimmer.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/controller/food/food_controller.dart';
import 'package:nhom_17/features/app/screen/all_foods/all_foods.dart';
import 'package:nhom_17/features/app/screen/home/widgets/home_app_bar.dart';
import 'package:nhom_17/features/app/screen/home/widgets/home_tags.dart';
import 'package:nhom_17/features/app/screen/home/widgets/promo_slider.dart';
import 'package:nhom_17/features/app/screen/search/search_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foodsController = Get.put(FoodController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const HomeAppBar(),
                  const SizedBox(height: 15,),
                  SearchContainer(text: "Món ăn hôm nay..", onTap: ()=> Get.to(()=>SearchScreen()),),
                  const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: "Các nhãn phổ biến",
                          showActionButton: false,
                          textColor: Colors.white,
                          ),
                        SizedBox(height: 10,),
                        HomeTags(),
                      ],
                    ),
                  )
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const PromoSlider(),
                  const SizedBox(height: 5,),
                  SectionHeading(
                    title: "Dành cho bạn",
                    showActionButton: true,
                    onPressed: () => Get.to(() => AllFoods(
                      title: 'Món ăn phổ biến',
                      futureMethod: foodsController.fetchAllFeaturedFoods(),
                    )),),
                  const SizedBox(height: 10,),
                  Obx((){
                    if(foodsController.isLoading.value) return const VerticalFoodsShimmer();
                    if(foodsController.featuredFoods.isEmpty) {
                      return Center(child: Text("Không tìm thấy dữ liệu!", style: Theme.of(context).textTheme.bodyMedium,),);
                    }
                    return GridLayout(
                      itemCount: foodsController.featuredFoods.length,
                      itemBuilder: (_, index){
                        return FoodCardVertical(food: foodsController.featuredFoods[index],);
                      },
                    );
                  })
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
