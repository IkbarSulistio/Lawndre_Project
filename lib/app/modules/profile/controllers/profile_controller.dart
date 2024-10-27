import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawndre_project/app/modules/customer_support/views/customer_support_view.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observables for profile data
  RxString userName = ''.obs;
  RxString email = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString profileImage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  // Fetch user data from Firestore
  void fetchUserProfile() {
    final User? user = _auth.currentUser;
    if (user != null) {
      _firestore
          .collection('users')
          .doc(user.uid)
          .snapshots()
          .listen((userDoc) {
        if (userDoc.exists) {
          userName.value = userDoc['userName'] ?? 'No Name';
          email.value = userDoc['email'] ?? 'No Email';
          phoneNumber.value = userDoc['phoneNumber'] ?? 'No Phone Number';
          profileImage.value =
              userDoc['profileImage'] ?? 'https://via.placeholder.com/150';
        } else {
          userName.value = '';
          email.value = '';
          phoneNumber.value = '';
          profileImage.value = '';
        }
      });
    }
  }

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
