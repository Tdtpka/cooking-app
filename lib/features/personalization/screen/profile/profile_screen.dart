import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/personalization/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/images/circular_image.dart';
import 'package:nhom_17/features/personalization/screen/profile/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Hồ sơ"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty? networkImage : 'images/avatar_default.jpg';
                      return CircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton.icon(
                      onPressed: () => controller.upLoadProfilePicture(),
                      label: const Text("Đổi ảnh đại diện"),
                      icon: const Icon(Iconsax.image),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8,),
              const SectionHeading(title: "Thông tin tài khoản", showActionButton: false,),
              const SizedBox(height: 8,),
              ProfileMenu(title: "ID tài khoản", value: controller.user.value.id, icon: Iconsax.copy , onPressed: (){},),
              
              ProfileMenu(title: "Tên tài khoản", value: controller.user.value.userName,onPressed: (){},),
              
              const SizedBox(height: 8,),
              const Divider(),
              const SizedBox(height: 8,),

              const SectionHeading(title: "Thông tin cá nhân", showActionButton: false,),
              const SizedBox(height: 8,),

              Obx(()=>ProfileMenu(title: "Tên người dùng", value: controller.user.value.name,onPressed: (){},)),
              Obx(() => ProfileMenu(title: "E-mail", value: controller.user.value.email, onPressed: (){},)),
              ProfileMenu(title: "Số điện thoại", value: controller.user.value.phoneNumber, onPressed: (){},),
              ProfileMenu(title: "Giới tính", value: controller.user.value.gender ?? '', onPressed: (){},),
              ProfileMenu(title: "Sinh nhật", value: controller.user.value.dob ?? '', onPressed: (){},),
              const Divider(),
              const SizedBox(height: 8,),
              Center(
                child: TextButton(onPressed: (){}, child: const Text("Close Account", style: TextStyle(color: Colors.red),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
