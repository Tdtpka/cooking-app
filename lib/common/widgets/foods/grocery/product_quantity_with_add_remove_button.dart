import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nhom_17/common/widgets/icons/circular_icon.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: 16,
          color: Colors.amber,
          backgroundColor: Colors.amber.shade100,
        ),
          const SizedBox(width: 4,),
          Text("2", style: Theme.of(context).textTheme.titleSmall,),
          const SizedBox(width: 4,),
          CircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: 16,
            color: Colors.amber.shade50,
            backgroundColor: Colors.amber.shade300,
          ),
      ],
    );
  }
}
