import 'package:get/get.dart';

import '../controllers/selimut_carpet_item_controller.dart';

class SelimutCarpetItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelimutCarpetItemController>(
      () => SelimutCarpetItemController(),
    );
  }
}
