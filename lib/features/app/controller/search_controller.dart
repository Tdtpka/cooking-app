import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class MySearchController extends GetxController {

  RxList<FoodModel> filteredFoods = <FoodModel>[].obs;
  
  final _db = FirebaseFirestore.instance;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllFoods();
  }

  void getAllFoods() async{
    final snapshot = await _db.collection("foods").get();
    filteredFoods.value = snapshot.docs.map((doc) => FoodModel.fromSnapshot(doc)).toList();
  }

  void getSearch(String query) async{
    final snapshot = await _db.collection("foods").where("name", isEqualTo: query).get();
    filteredFoods.value = snapshot.docs.map((doc) => FoodModel.fromSnapshot(doc)).toList();
  }

}