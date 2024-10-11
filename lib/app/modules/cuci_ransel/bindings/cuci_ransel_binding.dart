import 'package:get/get.dart';

import '../controllers/cuci_ransel_controller.dart';

class CuciRanselBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CuciRanselController>(
      () => CuciRanselController(),
    );
  }
}
