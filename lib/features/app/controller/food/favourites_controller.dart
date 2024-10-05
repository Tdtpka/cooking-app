import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/foods/food_repository.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  final favourites = <String, bool>{}.obs;
  @override
  void onInit(){
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites()async{
    final snapshot = await _db.collection("favourite").doc(userId).get();
    final json = snapshot.data();
    if(json != null){
      favourites.assignAll(json.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String foodId){
    return favourites[foodId] ?? false;
  }

  void toggleFavouriteFood(String foodId){
    if(!favourites.containsKey(foodId)){
      favourites[foodId] = true;
      saveFavouritesToStorage();
      Get.snackbar("Success", "Food has been added to your Favourite!");
    }else{
      favourites.remove(foodId);
      saveFavouritesToStorage();
      favourites.refresh();
      Get.snackbar("Success", "Food has been removed from your Favourite!");
    }
  }
  void saveFavouritesToStorage()async{
    await _db.collection("favourite").doc(userId).set(favourites);
  }
  Future<List<FoodModel>> favouriteFoods() async{
    return await FoodRepository.instance.getFavouriteFoods(favourites.keys.toList());
  }
}