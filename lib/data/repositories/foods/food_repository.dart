import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nhom_17/features/app/model/food_model.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/app/model/recipe_model.dart';
import 'package:nhom_17/features/app/model/type_model.dart';

class FoodRepository extends GetxController{
  static FoodRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<FoodModel>> getFeaturedFoods() async{
    try{
      final snapshot = await _db.collection("foods").where("isFeatured", isEqualTo: true).limit(4).get();
      return snapshot.docs.map((food) => FoodModel.fromSnapshot(food)).toList();
    }catch(e){
      throw e.toString();
    }
  }
  Future<List<FoodModel>> getAllFeaturedFoods() async{
    try{
      final snapshot = await _db.collection("foods").where("isFeatured", isEqualTo: true).get();
      return snapshot.docs.map((food) => FoodModel.fromSnapshot(food)).toList();
    }catch(e){
      throw e.toString();
    }
  }
  Future<List<FoodModel>> fetchFoodsByQuery(Query query) async{
    try{
        final querySnapshot = await query.get();
        final List<FoodModel> foodList = querySnapshot.docs.map((doc)=> FoodModel.fromQuerySnapshot(doc)).toList();
        return foodList;
    }catch(e){
      throw e.toString();
    }
  }

  //
  Future<List<FoodModel>> getFoodsForType({required String typeId, int limit = -1}) async {
    try{
      final querySnapshot = limit == -1
      ? await _db.collection("foods").where("typeId", isEqualTo: typeId).get()
      : await _db.collection("foods").where("typeId", isEqualTo: typeId).limit(limit).get();

      final foods = querySnapshot.docs.map((doc) => FoodModel.fromSnapshot(doc)).toList();
      return foods;
    }catch(e){
      throw e.toString();
    }
  }

  Future<List<FoodModel>> getFoodsForTag({required String tagId, int limit = -1}) async {
    try{
      QuerySnapshot foodTagQuery = limit == -1
      ? await _db.collection("foodtag").where("tagId", isEqualTo: tagId).get()
      : await _db.collection("foodtag").where("tagId", isEqualTo: tagId).limit(limit).get();

      List<String> foodIds = foodTagQuery.docs.map((doc) => doc["foodId"] as String).toList();

      final foodsQuery = await _db.collection("foods").where(FieldPath.documentId, whereIn: foodIds).get();

      List<FoodModel> foods = foodsQuery.docs.map((doc) => FoodModel.fromSnapshot(doc)).toList();
      return foods;
    }catch(e){
      throw e.toString();
    }
  }
  Future<List<FoodModel>> getFavouriteFoods(List<String> foodIds) async{
    try{
        final snapshot = await _db.collection("foods").where(FieldPath.documentId, whereIn: foodIds).get();
        return snapshot.docs.map((querySnapshot) => FoodModel.fromSnapshot(querySnapshot)).toList();
    }catch(e){
      return [];
    }
  }

  Future<List<RecipeModel>> getRecipes(Map<String, dynamic> recipe) async{
    try{
      final listRecipe = recipe.keys.toList();
      final snapshot = await _db.collection("recipes").where(FieldPath.documentId, whereIn: listRecipe).get();
      return snapshot.docs.map((querySnapshot) => RecipeModel.fromSnapshot(querySnapshot)).toList();
    }catch(e){
      return [];
    }

  }

  Future<TypeModel> getTypeOfFood(String typeId) async{
    try{
      final snapshot = await _db.collection("types").doc(typeId).get();
      return TypeModel.fromSnapshot(snapshot);
    }catch(e){
      throw e.toString();
    }
  }


}