import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserModel extends GetxController{
  final String id;
  String email;
  String userName;
  String profilePicture;
  String phoneNumber;
  String name;
  String? gender;
  String? dob;
  
  UserModel({
    required this.id,
    required this.email,
    required this.userName,
    required this.profilePicture,
    required this.name,
    required this.phoneNumber,
    this.gender,
    this.dob,
  });
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc){
    if(doc.data() != null){
      final data = doc.data()!;
      return UserModel(
      id: doc.id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      profilePicture: data['profile_picture'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      userName: data['userName'] ?? '',
      gender : data['gender'] ?? '',
      dob: data['dob'] ?? ''
      );
    }
    return UserModel.empty();
  }
  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'email': email,
      'name': name,
      'profile_picture': profilePicture,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'dob': dob,
      'gender': gender,
    };
  }
  static UserModel empty() => UserModel(id: '', email: '', name: '', profilePicture: '', userName: '', phoneNumber: '', dob: '', gender: '');
}