import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel{
  String id;
  String name;
  List<String> tags;
  String? description;
  List<String>? images;
  bool? isFeatured;
  String thumbnail;
  double time;
  int diet;
  String? typeId;
  List<String> cooking;
  Map<String, dynamic> recipes;
  String? calories;
  String? type;
  
  FoodModel({
    required this.id,
    this.typeId,
    this.isFeatured,
    required this.name,
    this.images,
    required this.time,
    this.description,
    required this.thumbnail,
    required this.diet,
    required this.tags,
    required this.cooking,
    required this.recipes,
    this.calories,
    this.type,
  });
  
  Map<String, dynamic> toJson(){
    return {
      'cooking': cooking,
      'description': description ?? '',
      'diet': diet,
      'images': images ?? [],
      'isFeatured': isFeatured ?? '',
      'name': name,
      'recipes': recipes,
      'tags': tags,
      'thumbnail': thumbnail,
      'time': time,
      'typeId': typeId ?? '',
      'calories': calories ?? '',
      'type': type ?? '',
    };
  }

  factory FoodModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if(doc.data() == null) return FoodModel.empty();
    final data = doc.data()!;
    return FoodModel(
      id: doc.id,
      type: data['type'] ?? '',
      typeId : data['typeId'] ?? '',
      isFeatured : data['isFeatured'] ?? false,
      name : data['name'],
      images : data['images'] != null ? List<String>.from(data['images']) :[],
      time : double.parse((data['time'] ?? 0.0).toString()),
      description : data['description'] ?? '',
      thumbnail : data['thumbnail'] ??'',
      calories: data['calories'] ?? '',
      diet : int.parse((data['diet'] ?? 0).toString()),
      tags : data['tags'] != null ? List<String>.from(data['tags']) : [],
      cooking : data['cooking'] != null ? List<String>.from(data['cooking']) : [],
      recipes : data['recipes'] != null ? Map<String, dynamic>.from(data['recipes']) : {},
    );
  }
  factory FoodModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> doc){
    final data = doc.data() as Map<String, dynamic>;
    return FoodModel(
      id: doc.id,
      type: data['type'] ??'',
      typeId : data['typeId'] ?? '',
      isFeatured : data['isFeatured'] ?? false,
      name : data['name'],
      images : data['images'] != null ? List<String>.from(data['images']) :[],
      time : double.parse((data['time'] ?? 0.0).toString()),
      description : data['description'] ?? '',
      thumbnail : data['thumbnail'] ??'',
      calories: data['calories'] ?? '',
      diet : int.parse((data['diet'] ?? 0).toString()),
      tags : data['tags'] != null ? List<String>.from(data['tags']) : [],
      cooking : data['cooking'] != null ? List<String>.from(data['cooking']) : [],
      recipes : data['recipes'] != null ? Map<String, dynamic>.from(data['recipes']) : {},
    );
  }

  static FoodModel empty() => FoodModel(id: '',type: '', name: '', time: 0.0, thumbnail: '',calories: '', diet: 0, tags: [], cooking: [], recipes: {});
}