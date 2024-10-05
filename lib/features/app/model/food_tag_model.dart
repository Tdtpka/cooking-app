import 'package:cloud_firestore/cloud_firestore.dart';

class FoodTagModel {
  final String foodId;
  final String tagId;
  FoodTagModel({required this. tagId, required this.foodId});

  Map<String, dynamic> toJson(){
    return{
      'foodId': foodId,
      'tagId': tagId,
    };
  }

  factory FoodTagModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;
    return FoodTagModel(
      tagId: data['tagId'] as String,
      foodId: data['foodId'] as String,
    );
  }
}