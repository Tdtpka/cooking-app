import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:nhom_17/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:nhom_17/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';
import 'package:nhom_17/common/widgets/texts/section_heading.dart';
import 'package:nhom_17/features/app/screen/grocery/grocery_screen.dart';
import 'package:nhom_17/features/app/screen/home/home.dart';
import 'package:nhom_17/features/app/screen/store/store_screen.dart';
import 'package:nhom_17/features/app/screen/wishlist/wishlist.dart';
import 'package:nhom_17/features/authentication/controller/signout_controller.dart';
import 'package:nhom_17/features/personalization/controller/user_controller.dart';
import 'package:nhom_17/features/personalization/screen/profile/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              height: 250,
              child: Column(
                children: [
                  CustomAppBar(
                    title: Text("Tài khoản", style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),
                  ),
                  const SizedBox(height: 8,),
                  Obx((){
                    if(!controller.isLoading.value){
                      final user = controller.user.value;
                      return UserProfileTile(user: user, onPressed: () => Get.to(() => const ProfileScreen()),);
                    }else{
                      return ListTile(
                        leading: ShimmerEffect(width: 50, height: 50, radius: 100,),
                        title: ShimmerEffect(width: 100, height: 15),
                        subtitle: ShimmerEffect(width: 100, height: 15),
                        trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: Colors.white,)),
                      );
                    }
                  }),
                  const SizedBox(height: 8,)
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SectionHeading(title: "Menu", showActionButton: false,),
                  const SizedBox(height: 8,),
                  GestureDetector(
                    onTap: ()=> Get.to(()=> HomeScreen()),
                    child: const SettingsMenuTile(icon: Iconsax.shopping_bag, title: "Home Page", subTitle: "The first page")),
                  GestureDetector(
                    onTap: ()=> Get.to(()=> Wishlist()),
                    child: const SettingsMenuTile(icon: Iconsax.heart, title: "My Favourite", subTitle: "A list of your favourite foods")),
                  GestureDetector(
                    onTap: ()=> Get.to(()=> StoreScreen()),
                    child: const SettingsMenuTile(icon: Iconsax.cake, title: "Today Food", subTitle: "A page of popular foods")),
                  GestureDetector(
                    onTap: ()=> Get.to(()=> GroceryScreen()),
                    child: const SettingsMenuTile(icon: Iconsax.shopping_bag, title: "My Grocery List", subTitle: "A list of recipes")),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        final controller = Get.put(SignoutController());
                        controller.signOut();
                      },
                      child: const Text("Đăng xuất"),
                    ),
                  ),
                  const SizedBox(height: 8*2.5,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
