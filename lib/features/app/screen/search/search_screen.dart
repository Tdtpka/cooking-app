import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/app/controller/search_controller.dart';
import 'package:nhom_17/features/app/screen/food_details/food_detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MySearchController());
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (search){
            controller.getSearch(search);
          },
          decoration: InputDecoration(hintText: 'Tìm kiếm'),
        ),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.filteredFoods.length,
        itemBuilder: (context, index) {
          final food = controller.filteredFoods[index];
          return GestureDetector(
            onTap: () => Get.to(()=> ProductDetailScreen(food: food)),
            child: ListTile(
              title: Text(food.name),
            ),
          );
        },
      )),
    );
  }
}