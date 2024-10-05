import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/Types/Type_card.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';
import 'package:nhom_17/features/app/model/type_model.dart';
import 'package:nhom_17/features/app/screen/type/type_foods.dart';

class TypeShowcase extends StatelessWidget {

  final List<String> images;
  final TypeModel type;
  const TypeShowcase({
    super.key,
    required this.images,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=> TypeFoods(type: type)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            TypeCard(showBorder: false, type: type,),
            Row(children: images.map((image) => TypeTopFoodImageWidget(image: image, context: context)).toList())
          ],
        ),
      ),
    );
  }
}

class TypeTopFoodImageWidget extends StatelessWidget {
  const TypeTopFoodImageWidget({
    super.key,
    required this.image,
    required this.context,
  });

  final String image;
  final dynamic context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(right: 8),
        backgroundColor: Colors.white,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, downloadProgress) => const ShimmerEffect(width: 100, height: 100),
          imageUrl: image,
          errorWidget:(context, url, error) => const Icon(Icons.error),
          
        ),
      ),
    );
  }
}
