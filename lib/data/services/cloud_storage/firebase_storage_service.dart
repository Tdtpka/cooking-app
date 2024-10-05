import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService extends GetxController{
  static FirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;


  Future<Uint8List> getImageDataFromAssets(String path) async{
    try{
      final bytaData = await rootBundle.load(path);
      final imageData = bytaData.buffer.asUint8List(bytaData.offsetInBytes, bytaData.lengthInBytes);
      return imageData;
    }catch(e){
      throw "Error loading image data: $e";
    }
  }

  Future<String> uploadImageData(String path, Uint8List image, String name) async{
    try{
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      throw e.toString();
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async{
    try{
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      throw e.toString();
    }
  }
}