import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  const SettingsMenuTile({super.key, required this.icon, required this.title, required this.subTitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.amber,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
    );
  }
}