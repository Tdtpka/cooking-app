import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  String id;
  String name;
  String? image;
  String unit;

  RecipeModel({
    required this.id,
    required this.name,
    required this.unit,
    this.image,
  });

  static RecipeModel empty() => RecipeModel(name: '', unit: '', image: '', id: '');

  Map<String, dynamic> toJson(){
    return{
      'name': name,
      'image': image,
      'unit': unit,
    };
  }

  factory RecipeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if(doc.data() == null) return RecipeModel.empty();
    final data = doc.data()!;
    return RecipeModel(
      id: doc.id,
      name: data['name'] ?? '',
      unit: data['unit'] ?? '',
      image: data['image'] ?? '',
    );
  }
}