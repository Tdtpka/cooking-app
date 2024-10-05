import 'package:cloud_firestore/cloud_firestore.dart';

class TagModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  TagModel({
    required this.id,
    required this.name,
    required this. image,
    required this.isFeatured,
    this.parentId ='',
  });

  static TagModel empty() => TagModel(id: '', name: '', image: '', isFeatured: false);

  factory TagModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc){
    if(doc.data() != null){
      final data = doc.data()!;
      return TagModel(
        id: doc.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parent_id'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    }else{
      return TagModel.empty();
    }
  } 

  Map<String, dynamic> toJson(){
    return{
      'name': name,
      'image': image,
      'parent_id': parentId,
      'isFeatured': isFeatured,
    };
  }
}