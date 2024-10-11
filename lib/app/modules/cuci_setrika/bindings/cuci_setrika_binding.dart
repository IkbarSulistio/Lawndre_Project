import 'package:get/get.dart';

import '../controllers/cuci_setrika_controller.dart';

class CuciSetrikaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CuciSetrikaController>(
      () => CuciSetrikaController(),
    );
  }
}
