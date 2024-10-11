import 'package:get/get.dart';

import '../controllers/pickup_order_controller.dart';

class PickupOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickupOrderController>(
      () => PickupOrderController(),
    );
  }
}
