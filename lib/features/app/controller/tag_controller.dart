import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/foods/food_repository.dart';
import 'package:nhom_17/data/repositories/tags/tags_repository.dart';
import 'package:nhom_17/features/app/model/food_model.dart';
import 'package:nhom_17/features/app/model/tag_model.dart';

class TagController extends GetxController{
  static TagController get instance => Get.find();

  RxBool isLoading = false.obs;
  final _tagRepository = Get.put(TagsRepository());
  RxList<TagModel> allTags = <TagModel>[].obs;
  RxList<TagModel> featuredTags = <TagModel>[].obs;
  
  @override
  void onInit(){
    fetchTags();
    super.onInit();
  }
  //Load Data
  Future<void> fetchTags() async{
    try{
      isLoading.value = true;
      final tags = await _tagRepository.getAllTags();
      //update the tags list
      allTags.assignAll(tags);

      //filled featured tags
      featuredTags.assignAll(allTags.where((tag) => tag.isFeatured && tag.parentId.isEmpty).toList());
    }catch(e){
      throw e.toString();
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<TagModel>> getSubTags(String tagId) async{
    try{
      final subTags = await _tagRepository.getSubTags(tagId);
      return subTags;
    }catch(e){
      return [];
    }
  }

  Future<List<FoodModel>> getTagFoods({required String tagId, int limit = 4}) async{
    try{
      final foods = await FoodRepository.instance.getFoodsForTag(tagId: tagId, limit: limit);
      return foods;
    }catch(e){
      return [];
    }
  }
}