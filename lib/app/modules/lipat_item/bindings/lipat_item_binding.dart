import 'package:get/get.dart';

import '../controllers/lipat_item_controller.dart';

class LipatItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LipatItemController>(
      () => LipatItemController(),
    );
  }
}
