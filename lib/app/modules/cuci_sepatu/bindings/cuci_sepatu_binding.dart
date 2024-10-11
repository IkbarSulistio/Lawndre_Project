import 'package:get/get.dart';

import '../controllers/cuci_sepatu_controller.dart';

class CuciSepatuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CuciSepatuController>(
      () => CuciSepatuController(),
    );
  }
}
