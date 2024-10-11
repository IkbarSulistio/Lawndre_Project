import 'package:get/get.dart';

import '../controllers/selimut_carpet_controller.dart';

class SelimutCarpetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelimutCarpetController>(
      () => SelimutCarpetController(),
    );
  }
}
