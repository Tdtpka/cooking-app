import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomTabBar({
    super.key,
    required this.tabs,
  });
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.orange,
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.amber,
        tabs: tabs
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}