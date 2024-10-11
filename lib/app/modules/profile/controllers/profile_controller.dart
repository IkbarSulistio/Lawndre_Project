import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/customer_support/views/customer_support_view.dart';

class ProfileController extends GetxController {
  // Fungsi untuk menangani aksi ketika menu item ditekan
  void onMenuItemTap(String title) {
    switch (title) {
      case 'Aktivitas':
        Get.toNamed('/aktivitas');
        break;
      case 'Pilih Bahasa':
        Get.toNamed('/language-selection');
        break;
      case 'Promo':
        Get.toNamed('/promo');
        break;
      case 'Pusat Bantuan':
        Get.to(CustomerSupportView());
        break;
      case 'Alamat':
        Get.toNamed('/address');
        break;
      default:
        print('Unknown menu item: $title');
    }
  }
}
