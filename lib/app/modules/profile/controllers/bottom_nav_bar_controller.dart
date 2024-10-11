import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/history/views/history_view.dart';
import 'package:lawndre_project/app/modules/home_page/views/home_page_view.dart';
import 'package:lawndre_project/app/modules/nota_pemesanan/views/nota_pemesanan_view.dart';
import 'package:lawndre_project/app/modules/profile/views/profile_view.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    switch (index){
      case 0:
        Get.off(HomePageView());
        break;
      case 1:
        Get.off(NotaPemesananView());
        break;
      case 2:
        Get.off(HistoryView());
        break;
      case 3:
        Get.off(ProfileView());
        break;
    }
  }
}