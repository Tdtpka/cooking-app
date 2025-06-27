import 'package:nhom_17/features/personalization/model/user_model.dart';
import 'package:nhom_17/data/repositories/authentication/authentication_repository.dart';
import 'package:nhom_17/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController  extends GetxController{
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async{
    try{
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        name: name.text.trim(),
        profilePicture: '',
        userName: userName.text.trim(),
        phoneNumber: phoneNumber.text.trim()
      );
      final userRepository = Get.put(UserRepository());
      
      await userRepository.saveUserRecord(newUser);
      await FirebaseAuth.instance.currentUser?.reload();
      AuthenticationRepository.instance.screenRedirect();
      email.clear();
      password.clear();
      userName.clear();
      name.clear();
      phoneNumber.clear();
      Get.snackbar("Sign in: ", "Sign in success");
    }catch(e){
      if(password.text.length<6){
        Get.snackbar("Error!", "Password must least 6 characters");
      }else if(await UserRepository.instance.findUser(email.text)){
        Get.snackbar("Error!", "Email was used");
      }
    }
  }
  
}