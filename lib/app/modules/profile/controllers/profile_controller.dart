import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawndre_project/app/modules/customer_support/views/customer_support_view.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      case 'Logout':
        logout();
        break;
      default:
        print('Unknown menu item: $title');
    }
  }

  // Fungsi untuk logout pengguna
  void logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login'); // Arahkan ke halaman login setelah logout
  }
}
