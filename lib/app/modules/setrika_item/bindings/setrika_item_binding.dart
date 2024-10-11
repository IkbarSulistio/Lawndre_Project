import 'package:get/get.dart';

import '../controllers/setrika_item_controller.dart';

class SetrikaItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetrikaItemController>(
      () => SetrikaItemController(),
    );
  }
}
