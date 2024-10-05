import 'package:flutter/widgets.dart';
import 'package:nhom_17/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:nhom_17/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:nhom_17/common/widgets/types/type_showcase.dart';
import 'package:nhom_17/features/app/controller/type_controller.dart';
import 'package:nhom_17/features/app/model/tag_model.dart';

class TagTypes extends StatelessWidget {
  const TagTypes({super.key, required this.tag});
  final TagModel tag;

  @override
  Widget build(BuildContext context) {
    final controller = TypeController.instance;
    return FutureBuilder(
      future: controller.getTypesForTag(tag.id),
      builder: (context, snapshot){
        const loader = Column(
          children: [
            ListTileShimmer(),
            SizedBox(height: 8),
            BoxesShimmer(),
            SizedBox(height: 8,)
          ],
        );
        if(snapshot.connectionState == ConnectionState.waiting){
          return loader;
        }
        if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
          return const Center(child: Text("Không tìm thấy dữ liệu!"),);
        }
        if(snapshot.hasError){
          return const Center(child: Text("Something went wrong.."),);
        }
        final types = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: types.length,
          itemBuilder: (_, index){
            final type = types[index];
            return FutureBuilder(
              future: controller.getTypeFoods(typeId: type.id, limit: 3),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return loader;
                }
                if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                  return const Center(child: Text("Không tìm thấy dữ liệu!"),);
                }
                if(snapshot.hasError){
                  return const Center(child: Text("Something went wrong.."),);
                }
                final foods = snapshot.data!;
                return TypeShowcase(type: type, images: foods.map((food) => food.thumbnail).toList(),);
              }
              
            );
          }
        );
        
      }
    );
  }
}