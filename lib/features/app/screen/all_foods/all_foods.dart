import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/foods/sortable/sortable_products.dart';
import 'package:nhom_17/common/widgets/shimmers/vertical_foods_shimmer.dart';
import 'package:nhom_17/features/app/controller/all_foods_controller.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class AllFoods extends StatelessWidget {
  const AllFoods({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<FoodModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllFoodsController());
    return Scaffold(
      appBar: CustomAppBar(title: Text(title), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24), 
        child: FutureBuilder(
          future: futureMethod?? controller.fetchFoodsByQuery(query),
          builder: (context, snapshot){
            const loader = VerticalFoodsShimmer();
            if(snapshot.connectionState == ConnectionState.waiting){
              return loader;
            }
            if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
              return const Center(child: Text("Không tìm thây dữ liệu!"),);
            }
            if(snapshot.hasError){
              return const Center(child: Text("Something went wrong.."),);
            }
            final foods = snapshot.data!;
            return SortableProducts(foods: foods,);
          }
          ),
        ),
      ),
    );
  }
}
