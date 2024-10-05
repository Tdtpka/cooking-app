import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/app/model/tag_model.dart';

class TagsRepository extends GetxController{
  static TagsRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<TagModel>> getAllTags() async{
    try{
      final snapshot = await _db.collection("tags").get();
      final list = snapshot.docs.map((document) => TagModel.fromSnapshot(document)).toList();
      return list;
    }catch(e){
      throw e.toString();
    }
  }
  Future<List<TagModel>> getSubTags(String tagId) async{
    try{
      final snapshot = await _db.collection("tags").where("ParentID", isEqualTo: tagId).get();
      final result = snapshot.docs.map((document) => TagModel.fromSnapshot(document)).toList();
      return result;
    }catch(e){
      throw e.toString();
    }
  }

}