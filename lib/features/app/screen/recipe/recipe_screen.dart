import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/foods/recipe/recipe_item.dart';
import 'package:nhom_17/common/widgets/shimmers/vertical_foods_shimmer.dart';
import 'package:nhom_17/features/app/controller/recipe/recipe_controller.dart';
import 'package:nhom_17/navigation_menu.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(RecipeController());
    final RxBool clear = false.obs;
    return Obx(()=>
      Scaffold(
        appBar: CustomAppBar(
          title: Text("Danh sách nguyên liệu", style: Theme.of(context).textTheme.headlineSmall,),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                FutureBuilder(
                  future: controller.getGroceryList(),
                  builder: (context, snapshot) {
                    const loader = VerticalFoodsShimmer(itemCount: 6,);
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return loader;
                    }
                    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                      return Center(child: Column(
                        children: [
                          Text("Danh sách trống!"),
                          TextButton.icon(
                            onPressed: ()=> Get.offAll(()=> const NavigationMenu()),
                            label: Text("Thêm vài nguyên liệu.."),
                            icon: Icon(Icons.add_rounded),
                          )
                        ],
                      ),);
                    }
                    if(snapshot.hasError){
                      return const Center(child: Text("Something went wrong.."),);
                    }
                    final list = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.all(0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (_,__) => const SizedBox(height: 20,),
                        itemCount: list.length,
                        itemBuilder: (_, index){
                          final item = controller.groceryList[list[index].id];
                          final quantity = item!["quantity"];
                          final RxBool isBought = false.obs;
                          isBought.value = item["isBought"];
                          return RecipeItem(item: list[index], quantity: quantity, isBought: isBought,);
                        }
                      ),
                    );
                  }
                )
              ],
            ),
          ),
      
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              clear.value = !clear.value;
              controller.clearGroceryList();
              },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,),
            child: Text("Xóa danh sách"),
          ),
        ),
      ),
    );
  }
}
