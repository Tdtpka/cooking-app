import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/app/model/recipe_model.dart';

class GroceryRepository extends GetxController{

  static GroceryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  
  Future<List<RecipeModel>> getGroceryRecipes(List<String> recipeIds) async{
    try{
        final snapshot = await _db.collection("recipes").where(FieldPath.documentId, whereIn: recipeIds).get();
        return snapshot.docs.map((querySnapshot) => RecipeModel.fromSnapshot(querySnapshot)).toList();
    }catch(e){
      return [];
    }
  }
}