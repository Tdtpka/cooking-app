import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/Types/Type_card.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/common/widgets/shimmers/type_shimmer_effect.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/controller/type_controller.dart';
import 'package:nhom_17/features/app/screen/type/type_foods.dart';

class AllTypesScreen extends StatelessWidget {
  const AllTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final typeController = TypeController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Nhãn",),
        showBackArrow: true,
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SectionHeading(title: "Bữa ăn", showActionButton: false,),
              const SizedBox(height: 20,),
              Obx((){
                if(typeController.isLoading.value) return const TypeShimmerEffect();
                if(typeController.allTypes.isEmpty){
                  return Center(child: Text("No data found!", style: Theme.of(context).textTheme.bodyMedium,),);
                }
                return GridLayout(
                  itemCount: typeController.allTypes.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index){
                    final type = typeController.allTypes[index];
                    return TypeCard(showBorder: true, onTap: () => Get.to(()=> TypeFoods(type: type,)), type: type,);
                  }
                );
              })
              
            ],
          ),
        ),
      ),
    );
  }
}