import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/profile/views/profile_view.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    switch (index){
      case 0:
        Get.offNamed('/home');
        break;
      case 1:
        Get.offNamed('/home');
        break;
      case 2:
        Get.offNamed('/home');
        break;
      case 3:
        Get.off(ProfileView());
        break;
    }
  }
}