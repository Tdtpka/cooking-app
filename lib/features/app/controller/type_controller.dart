import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/foods/food_repository.dart';
import 'package:nhom_17/data/repositories/type/type_repository.dart';
import 'package:nhom_17/features/app/model/food_model.dart';
import 'package:nhom_17/features/app/model/type_model.dart';

class TypeController extends GetxController{

  static TypeController get instance => Get.find();

  RxBool isLoading = true.obs;
  final _typeRepository = Get.put(TypeRepository());
  final RxList<TypeModel> allTypes = <TypeModel>[].obs;
  final RxList<TypeModel> featuredTypes = <TypeModel>[].obs;
  final RxString type = ''.obs;
  
  @override
  void onInit(){
    getFeaturedTypes();
    super.onInit();
  }
  
  Future<void> getFeaturedTypes() async{
    try{
      isLoading.value = true;
      final types = await _typeRepository.getAllTypes();
      //update the types list
      allTypes.assignAll(types);

      featuredTypes.assignAll(allTypes.where((type) => type.isFeatured ?? false).take(4));
    }catch(e){
      throw e.toString();
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<TypeModel>> getTypesForTag(String tagId) async{
    try{
      final types = await TypeRepository.instance.getTypesForTag(tagId);
      return types;
    }catch(e){
      return [];
    }
  }

  Future<List<FoodModel>> getTypeFoods({ required String typeId, int limit = -1}) async{
    try{
      final foods = await FoodRepository.instance.getFoodsForType(typeId: typeId, limit: limit);
      return foods;
    }catch(e){
      return [];
    }
  }
  

}