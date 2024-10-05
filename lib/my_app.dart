import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/authentication/screen/signin_screen.dart';
import 'package:nhom_17/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SigninScreen(),
      getPages: AppRoutes.pages,
    );
  }
}
