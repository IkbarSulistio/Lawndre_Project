import 'package:get/get.dart';

import '../controllers/cuci_gorden_controller.dart';

class CuciGordenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CuciGordenController>(
      () => CuciGordenController(),
    );
  }
}
