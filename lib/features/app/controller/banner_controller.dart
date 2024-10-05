import 'package:get/get.dart';
import 'package:nhom_17/data/repositories/banners/banner_repository.dart';
import 'package:nhom_17/features/app/model/banner_model.dart';

class BannerController extends GetxController{

  final carousalCurrentIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;
  @override
  void onInit(){
    super.onInit();
    fetchBanners();
  }

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async{
      try{
        isLoading.value = true;
        final bannerRepository = Get.put(BannerRepository());
        final banners = await bannerRepository.fetchBanners();
        this.banners.assignAll(banners);
      }catch(e){
        throw e.toString();
      }finally{
        isLoading.value = false;
      }
    }
}