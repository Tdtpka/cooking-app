import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:nhom_17/common/widgets/images/circular_image.dart';
import 'package:nhom_17/common/widgets/texts/food_title_text.dart';
import 'package:nhom_17/features/app/model/type_model.dart';

class TypeCard extends StatelessWidget {

  final bool showBorder;
  final void Function()? onTap;
  final TypeModel type;
  
  const TypeCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(4),
        showBorder: showBorder,
        borderColor: Colors.amber,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CircularImage(
                image: type.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 4,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodTitleText(title: type.name, smallSize: true,),
                  Text("${type.foodsCount ?? 0} foods", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}