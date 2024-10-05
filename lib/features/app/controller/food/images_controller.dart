import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class ImagesController extends GetxController{
  static ImagesController get instance => Get.find();

  RxString selectedProductImage =''.obs;

  List<String> getAllProductImages(FoodModel food){
    Set<String> images = {};
    images.add(food.thumbnail);
    selectedProductImage.value = food.thumbnail;
    if(food.images != null){
      images.addAll(food.images!);
    }
    return images.toList();
  }

  void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true,
      ()=>Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: 16,),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () =>Get.back(), child: const Text("Close")),
              ),
            )
          ],
        ),
      )
    );
  }
}