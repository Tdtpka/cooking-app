import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class CookingScreen extends StatelessWidget {
  const CookingScreen({super.key, required this.food});
  
  final FoodModel food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Các bước nấu ăn', style: TextStyle(color: Colors.orange.shade900),),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: food.cooking.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Bước ${index + 1}", style: TextStyle(color: Colors.white.withOpacity(0.7)),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      border: BorderDirectional(start: BorderSide(color: Colors.orange, width: 2), ),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(35), bottomLeft: Radius.circular(5), topLeft: Radius.circular(35), topRight: Radius.circular(5) )
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(food.cooking[index], textAlign: TextAlign.justify,)
                  ),
                ],
              ),
            
            );
          },
        ),
      ),
    );
  }
}
