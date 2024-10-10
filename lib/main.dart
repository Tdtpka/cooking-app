import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nhom_17/firebase_options.dart';
import 'package:nhom_17/my_app.dart';
import 'package:nhom_17/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
<<<<<<< HEAD
=======
import 'package:flutter_gemini/flutter_gemini.dart';
>>>>>>> 0aa85f8 (add AI)

Future<void> main() async{
  //WidgetsBinding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //GetX local storage
  await GetStorage.init();
<<<<<<< HEAD
=======

  Gemini.init(
    apiKey: "AIzaSyB3CkxsbXkx_3kR33E8IqUjrwL8gthW-Tg",
  );
  runApp(const MyApp());
>>>>>>> 0aa85f8 (add AI)
  //Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,)
  .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );  

  runApp(const MyApp());
}
