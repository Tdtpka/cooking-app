import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/foods/food_repository.dart';
import 'package:nhom_17/features/app/model/food_model.dart';
import 'package:nhom_17/features/app/model/recipe_model.dart';
import 'package:nhom_17/features/app/model/type_model.dart';

class FoodController extends GetxController{
  static FoodController get instance => Get.find();
  RxList<FoodModel> featuredFoods = <FoodModel>[].obs;
  final foodRepository = Get.put(FoodRepository());
  final isLoading = false.obs;
  final RxString type = "".obs;
  
  @override
  void onInit(){
    fetchFeaturedFoods();
    super.onInit();
  }
  void fetchFeaturedFoods() async{
    try{
      isLoading.value = true;
      final foods = await foodRepository.getFeaturedFoods();
      featuredFoods.assignAll(foods);
    }catch(e){
      throw e.toString();
    }finally{
      isLoading.value = false;
    }
  }
  Future<List<FoodModel>> fetchAllFeaturedFoods() async{
    try{
      final foods = await foodRepository.getFeaturedFoods();
      return foods;
      
    }catch(e){
      throw e.toString();
    }
  }

  Future<List<RecipeModel>> fetchRecipesOfFood(Map<String,dynamic> list) async{
    try{
      final recipes = await foodRepository.getRecipes(list);
      return recipes;
    }catch(e){
      throw e.toString();
    }
  }

  Future<TypeModel> fetchTypeOfFood(String typeId) async{
    try{
      final type = await foodRepository.getTypeOfFood(typeId);
      return type;
    }catch(e){
      return TypeModel.empty();
    }
  }

  
} 