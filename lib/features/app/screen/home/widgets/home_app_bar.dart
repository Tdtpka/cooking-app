import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/foods/grocery/list_menu_icon.dart';
import 'package:nhom_17/features/app/screen/grocery/grocery_screen.dart';
import 'package:nhom_17/navigation_menu.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: GestureDetector(
        onTap: () => Get.offAll(()=> NavigationMenu()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Chúc bạn một ngày tốt lành,", style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.orange.shade900),),
            Text("Let's cook!", style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),
          ],
        ),
      ),
      actions: [
        CartCounterIcon(
          onPressed: ()=>Get.to(()=> GroceryScreen()),
          iconColor: Colors.orange.shade900,
          hoverColor: Colors.white.withOpacity(0.5),
        )
      ],
    );
  }
}
