import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/Types/Type_card.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/appbar/tabbar.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/search_container.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/common/widgets/foods/grocery/list_menu_icon.dart';
import 'package:nhom_17/common/widgets/shimmers/type_shimmer_effect.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/controller/tag_controller.dart';
import 'package:nhom_17/features/app/controller/type_controller.dart';
import 'package:nhom_17/features/app/screen/grocery/grocery_screen.dart';
import 'package:nhom_17/features/app/screen/search/search_screen.dart';
import 'package:nhom_17/features/app/screen/store/widgets/tag_tab.dart';
import 'package:nhom_17/features/app/screen/type/all_types.dart';
import 'package:nhom_17/features/app/screen/type/type_foods.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typeController = Get.put(TypeController());
    final tags = TagController.instance.featuredTags;
    return DefaultTabController(
      length: tags.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text("Today food", style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            CartCounterIcon(iconColor: Colors.orange, onPressed: ()=>Get.to(()=>const GroceryScreen()))
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled){
            return[
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
      
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 8,),
                      SearchContainer(text: "Tìm món ăn..", showBorder: true, padding: EdgeInsets.zero, onTap: () => Get.to(()=>SearchScreen()),),
                      const SizedBox(height: 16,),
      
                      SectionHeading(title: "Bữa ăn", showActionButton: true, onPressed: ()=> Get.to(()=> const AllTypesScreen()),),
                      const SizedBox(height: 8,),
      
                      Obx((){
                        if(typeController.isLoading.value) return const TypeShimmerEffect();
                        if(typeController.featuredTypes.isEmpty){
                          return Center(child: Text("No data found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.amber),),);
                        }
                        return GridLayout(
                          itemCount: typeController.featuredTypes.length,
                          mainAxisExtent: 70,
                          itemBuilder: (_, index){
                            final type = typeController.featuredTypes[index];
                            return TypeCard(showBorder: true, type: type, onTap: ()=> Get.to(()=> TypeFoods(type: type)),);
                          }
                      );
                      })
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: tags.map((tag) => Tab(child: Text(tag.name),)).toList(),
                )
              ),
            ];
          },
          body: TabBarView(
            children: tags.map((tag) => TagTab(tag: tag,)).toList(),
          ),
        ),
      ),
    );
  }
}
