import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/foods/food_cards/food_card_vertical.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/common/widgets/shimmers/vertical_foods_shimmer.dart';
import 'package:nhom_17/features/app/controller/food/favourites_controller.dart';
import 'package:nhom_17/navigation_menu.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Món ăn yêu thích", style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              FutureBuilder(
                future: controller.favouriteFoods(),
                builder: (context, snapshot) {
                  const loader = VerticalFoodsShimmer(itemCount: 6,);
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return loader;
                  }
                  if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                    return Center(child: Column(
                      children: [
                        Text("Bạn chưa có món ăn yêu thích!"),
                        TextButton.icon(
                          onPressed: ()=> Get.off(()=> const NavigationMenu()),
                          label: Text("Thêm vài món ăn.."),
                          icon: Icon(Icons.add_rounded),
                        )
                      ],
                    ),);
                  }
                  if(snapshot.hasError){
                    return const Center(child: Text("Something went wrong.."),);
                  }
                  final foods = snapshot.data!;
                  return GridLayout(
                    itemCount: foods.length,
                    itemBuilder: (_, index) => FoodCardVertical( food: foods[index],)
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