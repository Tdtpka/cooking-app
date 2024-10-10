import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nhom_17/firebase_options.dart';
import 'package:nhom_17/my_app.dart';
import 'package:nhom_17/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<void> main() async{

  //WidgetsBinding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Gemini API
  await dotenv.load(fileName: ".env");
  Gemini.init(
    apiKey: dotenv.env["GEMINI_API_KEY"]!,
  );

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
