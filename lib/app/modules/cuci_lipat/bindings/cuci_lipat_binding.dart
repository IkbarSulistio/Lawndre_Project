import 'package:get/get.dart';

import '../controllers/cuci_lipat_controller.dart';

class CuciLipatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CuciLipatController>(
      () => CuciLipatController(),
    );
  }
}
