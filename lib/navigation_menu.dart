import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/features/app/screen/home/home.dart';
import 'package:nhom_17/features/app/screen/store/store_screen.dart';
import 'package:nhom_17/features/app/screen/wishlist/wishlist.dart';
<<<<<<< HEAD
=======
import 'package:nhom_17/features/gemini_ai/gemini_page.dart';
>>>>>>> 0aa85f8 (add AI)
import 'package:nhom_17/features/personalization/screen/settings/settings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.cake), label: "Today Meals"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Favourite"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
<<<<<<< HEAD
=======
            NavigationDestination(icon: Icon(Iconsax.message), label: "Chat with AI"),
>>>>>>> 0aa85f8 (add AI)
          ]
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value],)
    );
  }
}

class NavigationController extends GetxController{
  final RxInt selectedIndex = 0.obs;
<<<<<<< HEAD
  final screens = const [HomeScreen(), StoreScreen(),Wishlist(),SettingsScreen()];
=======
  final screens = const [HomeScreen(), StoreScreen(),Wishlist(),SettingsScreen(), GeminiPage()];
>>>>>>> 0aa85f8 (add AI)
}