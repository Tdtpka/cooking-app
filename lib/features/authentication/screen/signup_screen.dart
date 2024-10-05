import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/features/authentication/controller/signup_controller.dart';
import 'package:nhom_17/features/authentication/screen/signin_screen.dart';
import 'package:nhom_17/common/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen>{
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height/4.5,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70,),
                        Text("Tạo tài khoản mới", style: TextStyle(fontSize: 30, color: Colors.orange),),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 250,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(100, 10),
                                bottomLeft: Radius.elliptical(10, 10),
                                topRight: Radius.elliptical(30, 10),
                                bottomRight: Radius.elliptical(100, 10)
                              ),
                              color: Colors.amber
                            ),
                          ),
                        )
                      ],
                  ),
                ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: controller.email,
                        expands: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.orange)),
                          labelText: 'Email của bạn',
                          prefixIcon: Icon(Iconsax.sms, color: Colors.orange,)
                          ),
                      ),
                      SizedBox(height: 10,),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.hidePassword.value,
                          controller: controller.password,
                          expands: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.orange)),
                            labelText: 'Đặt mật khẩu',
                            prefixIcon: const Icon(Iconsax.password_check, color: Colors.orange,),
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value? Iconsax.eye : Iconsax.eye_slash, color: Colors.orange,),
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: controller.userName,
                        expands: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.orange)),
                          labelText: 'Tên tài khoản',
                          prefixIcon: Icon(Iconsax.user_edit, color: Colors.orange,)
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: controller.name,
                        expands: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.orange)),
                          labelText: 'Tên của bạn',
                          prefixIcon: Icon(Iconsax.user, color: Colors.orange,)
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: controller.phoneNumber,
                        expands: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.orange)),
                          labelText: 'Số điện thoại',
                          prefixIcon: Icon(Iconsax.call, color: Colors.orange,)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                MyButton(
                  onTab: (){
                    controller.signup();
                  },
                  text: "Đăng Ký"
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Đã có tài khoản?",
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
                            builder: (context) => const SigninScreen()
                          )
                        );
                      },
                      child: const Text(
                        "Đăng nhập",
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
          ),
        )
        ),
    );
  }
}