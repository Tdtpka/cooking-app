import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import 'package:nhom_17/common/widgets/foods/favourite_icon/favourite_icon.dart';
import 'package:nhom_17/common/widgets/images/rounded_image.dart';
import 'package:nhom_17/features/app/controller/food/images_controller.dart';
import 'package:nhom_17/features/app/model/food_model.dart';

class ProductImageSlider extends StatelessWidget {

  final FoodModel food;
  const ProductImageSlider({
    super.key,
    required this.food
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(food);
    return CurvedEdgeWidget(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(height: 300, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Obx((){
                final image = controller.selectedProductImage.value;
                return GestureDetector(
                  onTap: () => controller.showEnlargedImage(image),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    progressIndicatorBuilder: (_,__,downloadProgress) => CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: Colors.amber,
                      ),
                    ),
                );
                })
              ),
            )),
    
            Positioned(
              right: 0,
              bottom: 50,
              left: 20,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) =>Obx((){
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return RoundedImage(
                      imageUrl: images[index],
                      width: 80,
                      isNetworkImage: true,
                      backgroundColor: Colors.white,
                      border: Border.all(color: imageSelected? Colors.orange : Colors.transparent),
                      padding: const EdgeInsets.all(4),
                      onPressed: ()=>controller.selectedProductImage.value = images[index],
                    );
                  }),
                  separatorBuilder: (_,__) => const SizedBox(width: 8,),
                  itemCount: images.length
                  ),
              ),
            ),
            CustomAppBar(showBackArrow: true,actions: [FavouriteIcon(foodId: food.id,)],)
          ],
        ),
      )
    );
  }
}