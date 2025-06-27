import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/circular_container.dart';
import 'package:nhom_17/common/widgets/images/rounded_image.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';
import 'package:nhom_17/features/app/controller/banner_controller.dart';

class PromoSlider extends StatelessWidget {

  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return
    Obx(()
    {   if(controller.isLoading.value==true) return const ShimmerEffect(width: double.infinity, height: 190);
        if(controller.banners.isEmpty) {
          return const Center(child: Text("Không tìm thấy dữ liệu!"),);
        }else{
          return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1.1,
                      onPageChanged: (index, _) => controller.updatePageIndicator(index)
                    ),
                    items: controller.banners.map((banner)=> RoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: (){},
                    )).toList(),
                  ),
                  const SizedBox(height: 8,),
                  Center(
                    child: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for(int i = 0; i < controller.banners.length; i++)
                            CircularContainer(
                              width: 20,
                              height: 4,
                              margin: const EdgeInsets.only(right: 10),
                              backgroundColor: controller.carousalCurrentIndex.value == i? Colors.orange : Colors.amber.shade100,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
        }
    });
  }
}
