import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nhom_17/features/personalization/model/user_model.dart';
import 'package:nhom_17/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("users").doc(user.id).set(user.toJson());
    }catch(e){
      throw 'Try again';
    }
  }

  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection("users").doc(AuthenticationRepository.instance.authUser!.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    }catch(e){
      throw e.toString();
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection("users").doc(updatedUser.id).update(updatedUser.toJson());
    }catch(e){
      throw "err";
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection("users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    }catch(e){
      throw "err";
    }
  }
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection("users").doc(userId).delete();
    }catch(e){
      throw "err";
    }
  }

  Future<String> uploadImage(String path, XFile image)async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      throw e.toString();
    }
  }
}