import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/grocery/grocery_repository.dart';
import 'package:nhom_17/features/app/model/recipe_model.dart';

class GroceryController extends GetxController{
  static GroceryController get instance => Get.find();
  final _groceryRepository = Get.put(GroceryRepository());

  final _db = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  final groceryList = <String, Map<String, dynamic>>{}.obs;
  
  @override
  void onInit(){
    super.onInit();
    initGrocery();
  }

  Future<void> initGrocery()async{
    final snapshot = await _db.collection("grocery_list").doc(userId).get();
    final json = snapshot.data();
    if(json != null){
      groceryList.assignAll(json.map((key, value) => MapEntry(key, value as Map<String, dynamic>)));
    }
  }

  void addRecipe({required String recipeId, required int quantity}){
    if(!groceryList.containsKey(recipeId)){
      final recipe = {"isBought": false, "quantity": quantity} as Map<String, dynamic>;
      groceryList[recipeId] = recipe;
      saveGroceryToStorage();
    }else{
      updateQuantity(recipeId, quantity);
    }
  }
  void updateQuantity(String recipeId, int quantity){
    var recipe = groceryList[recipeId]!;
    recipe["quantity"] += quantity;
    groceryList[recipeId] = recipe;
    saveGroceryToStorage();
    groceryList.refresh();
  }

  void updateBought(String recipeId, bool isBought){
    var recipe = groceryList[recipeId]!;
    recipe["isBought"] = isBought;
    groceryList[recipeId] = recipe;
    saveGroceryToStorage();
    groceryList.refresh();
  }

  void removeRecipe(String recipeId){
    groceryList.remove(recipeId);
    saveGroceryToStorage();
    groceryList.refresh();
    Get.snackbar("Success", "Food has been removed from your Grocery!");
  }

  void clickBought(String recipeId, bool isBought){
    updateBought(recipeId, isBought);
  }

  void clearGroceryList()async{
    groceryList.clear();
    await _db.collection("grocery_list").doc(userId).delete();
    groceryList.refresh();
  }

  void saveGroceryToStorage()async{
    await _db.collection("grocery_list").doc(userId).set(groceryList);
    groceryList.refresh();
  }

  Future<List<RecipeModel>> getGroceryList() async{
    return await _groceryRepository.getGroceryRecipes(groceryList.keys.toList());
  }
}