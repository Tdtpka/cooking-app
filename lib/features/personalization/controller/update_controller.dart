import 'package:nhom_17/features/personalization/controller/user_controller.dart';
import 'package:nhom_17/data/repositories/user/user_repository.dart';
import 'package:nhom_17/features/personalization/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController{
  static UpdateController get instance => Get.find();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final name = TextEditingController();
  @override
  void onInit(){
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async{
    name.text = userController.user.value.name;
  }
  Future<void> updatedUserName() async{
    try{
      Map<String, dynamic> nameMap = {'name': name.text.trim()};
      await userRepository.updateSingleField(nameMap);

      userController.user.value.name = name.text.trim();
      Get.off(()=> const ProfileScreen());
    }catch(e){
      throw e.toString();
    }
  }
}