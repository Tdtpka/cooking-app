import 'package:nhom_17/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  final hidePassword = true.obs;

  Future<void> emailAndPasswordSignIn() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar("Error!", "Vui lòng điền email và mật khẩu");
    } else {
      final emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$',
        caseSensitive: false,
      );
      if (emailRegex.hasMatch(email.text.trim())) {
        try {
          await AuthenticationRepository.instance
              .login(email.text.trim(), password.text.trim());
          email.clear();
          password.clear();
          AuthenticationRepository.instance.screenRedirect();
          Get.snackbar("Signin:", "Signin success!");
        } catch (e) {
          Get.snackbar("Error!", "Email hoặc mật khẩu không chính xác");
        }
      }else{
        Get.snackbar("Error!", "Vui lòng nhập đúng định dạng email");
      }
    }
  }
}
