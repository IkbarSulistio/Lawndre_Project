import 'package:get/get.dart';

import '../controllers/nota_pemesanan_controller.dart';

class NotaPemesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotaPemesananController>(
      () => NotaPemesananController(),
    );
  }
}
