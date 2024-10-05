import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/image_text/vertical_image_text.dart';
import 'package:nhom_17/common/widgets/shimmers/tag_shimmer.dart';
import 'package:nhom_17/features/app/controller/tag_controller.dart';
import 'package:nhom_17/features/app/screen/tag/sub_tag_screen.dart';

class HomeTags extends StatelessWidget {
  const HomeTags({super.key});

  @override
  Widget build(BuildContext context) {
    final tagController = Get.put(TagController());
    return Obx((){
      if(tagController.isLoading.value) return const TagShimmer();
      if(tagController.featuredTags.isEmpty){
        return Center(child: Text("Không tìm thấy dữ liệu!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tagController.featuredTags.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            final tag = tagController.featuredTags[index];
            return VerticalImageText(
              image: tag.image,
              title: tag.name,
              onTap: () => Get.to(()=> SubTagScreen(tag: tag,)),
            );
          }
          ),
      );
    });
  }
}