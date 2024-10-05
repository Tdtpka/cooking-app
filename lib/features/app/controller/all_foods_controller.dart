import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/foods/food_repository.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class AllFoodsController extends GetxController{

  static AllFoodsController get instance => Get.find();
  final repository = FoodRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<FoodModel> foods = <FoodModel>[].obs;

  Future<List<FoodModel>> fetchFoodsByQuery(Query? query) async{
    try{
      if(query == null) return [];
      final foods = await repository.fetchFoodsByQuery(query);
      return foods;
    }catch(e){
      Get.snackbar('Error!', e.toString());
      return [];
    }
  }

  void sortFoods(String sortOption){
    selectedSortOption.value = sortOption;

    switch(sortOption){
      case "Name":
        foods.sort((a,b) => a.name.compareTo(b.name));
        break;
      case "Fast cook":
        foods.sort((a,b) => a.time.compareTo(b.time));
        break;
      case "Slow cook":
        foods.sort((a,b) => b.time.compareTo(a.time));
        break;
      case "Diet":
        foods.sort((a,b) => a.diet.compareTo(b.diet));
        break;
      default:
        foods.sort((a,b) => a.name.compareTo(b.name));
    }
  }
  void assignFoods(List<FoodModel> foods){
    this.foods.assignAll(foods);
    sortFoods("Name");
  }
}
