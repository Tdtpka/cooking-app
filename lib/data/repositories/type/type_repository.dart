import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/app/model/type_model.dart';

class TypeRepository extends GetxController{
  static TypeRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<TypeModel>> getAllTypes() async{
    try{
      final snapshot = await _db.collection("types").get();
      final result = snapshot.docs.map((documentSnapshot) => TypeModel.fromSnapshot(documentSnapshot)).toList();
      return result;
    }catch(e){
      throw e.toString();
    }
  }

  Future<TypeModel> getTypeOfFood(String typeId) async{
    try{
      final snapshot = await _db.collection("types").where("id", isEqualTo: typeId).get();
      final type = snapshot.docs.first.data();
      return TypeModel.fromJson(type);
    }catch(e){
      return TypeModel.empty();
    }
  }

  Future<List<TypeModel>> getTypesForTag(String tagId) async{
    try{
      QuerySnapshot typeTagQuery = await _db.collection("typetag").where("tagId", isEqualTo: tagId).get();
      List<String> typeIds = typeTagQuery.docs.map((doc) => doc['typeId'] as String).toList();

      final typesQuery = await _db.collection("types").where(FieldPath.documentId, whereIn: typeIds).limit(2).get();
      List<TypeModel> types = typesQuery.docs.map((doc)=> TypeModel.fromSnapshot(doc)).toList();
      return types;
    }catch(e){
      throw e.toString();
    }
  }
}