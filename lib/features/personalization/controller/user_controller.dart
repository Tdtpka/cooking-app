import 'package:image_picker/image_picker.dart';
import 'package:nhom_17/features/personalization/model/user_model.dart';
import 'package:nhom_17/data/repositories/authentication/authentication_repository.dart';
import 'package:nhom_17/data/repositories/user/user_repository.dart';
import 'package:nhom_17/features/authentication/screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final isLoading = true.obs;
  @override
  void onInit(){
    fetchUserRecord();
    super.onInit();
  }
  
  Future<void> fetchUserRecord() async{
    try{
      isLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      throw e.toString();
    }finally{
      isLoading.value = false;
    }
  }

  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(10),
      title: "Delete Account",
      middleText: "Bạn có chắc chắn muốn xóa tài khoản?",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text("Delete"),)
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      )
    );
  }
  void deleteUserAccount() async{
    try{
      await AuthenticationRepository.instance.deleteAccount();
      Get.to(() => const SigninScreen());
    }catch(e){
      throw e.toString();
    }
  }
  upLoadProfilePicture () async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if(image!=null){
        final imageUrl = await userRepository.uploadImage("Users/Images/Profile/${user.value.id}", image);
        Map<String, dynamic> json = {'profile_picture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        Get.snackbar("Upload Image:", "Your profile image has been updated!");
      }
    }catch(e){
      throw e.toString();
    }
  }
}