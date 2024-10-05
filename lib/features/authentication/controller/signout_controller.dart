import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/authentication/authentication_repository.dart';
import 'package:nhom_17/features/authentication/screen/signin_screen.dart';

class SignoutController extends GetxController{

  Future<void> signOut() async{
    try{
      await AuthenticationRepository.instance.logout();
      Get.offAll(()=>SigninScreen());
      Get.snackbar("Signout", "Signout success!");
    }catch(e){
      Get.snackbar("Error!", e.toString());
    }
  }
}