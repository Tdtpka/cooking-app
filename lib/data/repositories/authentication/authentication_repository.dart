import 'package:nhom_17/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:nhom_17/navigation_menu.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;
  
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  
  void screenRedirect() async{
    final user = _auth.currentUser;
    if(user != null){
      Get.offAll(() => const NavigationMenu());
    }
  }

  //Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      throw 'Try again';
    }
  }
  //Login

  Future<UserCredential> login(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      throw e.toString();
    }
  }
  //Logout
  Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
    }catch(e){
      throw "err";
    }
  }

  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    }catch(e){
      throw e.toString();
    }
  }
}