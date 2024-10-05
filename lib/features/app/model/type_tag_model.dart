import 'package:cloud_firestore/cloud_firestore.dart';

class TypeTagModel {
  final String typeId;
  final String tagId;
  TypeTagModel({required this. tagId, required this.typeId});

  Map<String, dynamic> toJson(){
    return{
      'typeId': typeId,
      'tagId': tagId,
    };
  }

  factory TypeTagModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;
    return TypeTagModel(
      tagId: data['tagId'] as String,
      typeId: data['typeId'] as String,
    );
  }
}