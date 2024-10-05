import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/shimmers/vertical_foods_shimmer.dart';
import 'package:nhom_17/common/widgets/types/type_card.dart';
import 'package:nhom_17/common/widgets/foods/sortable/sortable_products.dart';
import 'package:nhom_17/features/app/controller/type_controller.dart';
import 'package:nhom_17/features/app/model/type_model.dart';

class TypeFoods extends StatelessWidget {
  const TypeFoods({super.key, required this.type});

  final TypeModel type;

  @override
  Widget build(BuildContext context) {

    final controller = TypeController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text(type.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TypeCard(showBorder: true, type: type,),
              const SizedBox(height: 8,),
              FutureBuilder(
                future: controller.getTypeFoods(typeId: type.id),
                builder: (context, snapshot){
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
                  final typeFoods = snapshot.data!;
                  return SortableProducts(foods: typeFoods,);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}