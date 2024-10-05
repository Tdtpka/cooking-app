import 'package:cloud_firestore/cloud_firestore.dart';

class TypeModel{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? foodsCount;
  TypeModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.foodsCount
  });

  static TypeModel empty() => TypeModel(id: '', name: '', image: '', isFeatured: false, foodsCount: 0);

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'foodsCount': foodsCount,
    };
  }

  factory TypeModel.fromJson(Map<String, dynamic> json){
    final data = json;
    if(data.isEmpty) return TypeModel.empty();
    return TypeModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      foodsCount: int.parse((data['foodsCount'] ?? 0).toString())
    );
  }
  factory TypeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc){
    if(doc.data() == null) return TypeModel.empty();
    final data = doc.data()!;
    return TypeModel(
      id: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      foodsCount: int.parse((data['foodsCount'] ?? 0).toString())
    );
  }
}