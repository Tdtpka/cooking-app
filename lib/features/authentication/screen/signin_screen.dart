import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/features/authentication/controller/signin_controller.dart';
import 'package:nhom_17/features/authentication/screen/signup_screen.dart';
import 'package:nhom_17/common/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget{
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height/2.7,
                child: Stack(
                  children:[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 40, top: 40),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.white)),
                        color: Colors.amber,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Food", style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold),),
                          Text("Hôm nay ăn gì?", style: TextStyle(color: Colors.white, fontSize: 20),)
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -210,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.orange)),
                        labelText: "Nhập email của bạn..",
                        prefixIcon: Icon(Iconsax.sms, color: Colors.orange,)
                      ),
                    ),
                    SizedBox(height: 20,),
                    Obx(()=> TextFormField(
                      controller: controller.password,
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.orange,)),
                          prefixIcon: const Icon(Iconsax.password_check, color: Colors.orange,),
                          labelText: "Nhập mật khẩu..",
                          suffixIcon: IconButton(
                            onPressed: ()=> controller.hidePassword.value= !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value? Iconsax.eye: Iconsax.eye_slash, color: Colors.orange,)
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Quên mật khẩu?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.amber.shade800
                    ),
                  ),
                ),
              ),
              MyButton(
                onTab: (){
                  controller.emailAndPasswordSignIn();
                },
                text: "Đăng Nhập"
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Chưa có tài khoản?",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen()
                        )
                      );
                    },
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                        ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
        ),
    );
  }
}