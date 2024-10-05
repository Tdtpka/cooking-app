import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/images/circular_image.dart';
import 'package:nhom_17/features/personalization/model/user_model.dart';

class UserProfileTile extends StatelessWidget {
  
  final VoidCallback onPressed;
  final UserModel user;
  
  const UserProfileTile({
    super.key,
    required this.onPressed,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = false.obs;
    if(user.profilePicture != ''){
      isNetworkImage.value = true;
    }
    return ListTile(
      leading: CircularImage(image: user.profilePicture, isNetworkImage: isNetworkImage.value, width: 50,height: 50, padding: 0,),
      title: Text(user.name, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text(user.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: Colors.white,)),
    );
  }
}