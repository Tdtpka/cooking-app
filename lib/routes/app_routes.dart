import 'package:get/get.dart';
import 'package:nhom_17/features/app/screen/grocery/grocery_screen.dart';
import 'package:nhom_17/features/app/screen/home/home.dart';
import 'package:nhom_17/features/app/screen/store/today_screen.dart';
import 'package:nhom_17/features/app/screen/wishlist/wishlist.dart';
import 'package:nhom_17/features/personalization/screen/settings/settings.dart';
import 'package:nhom_17/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.today, page: () => const TodayScreen()),
    GetPage(name: Routes.favourite, page: () => const Wishlist()),
    GetPage(name: Routes.grocery, page: () => const GroceryScreen()),
    GetPage(name: Routes.setting, page: () => const SettingsScreen()),
  ];
}