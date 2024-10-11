import 'package:get/get.dart';

import '../controllers/schedule_pickup_controller.dart';

class SchedulePickupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulePickupController>(
      () => SchedulePickupController(),
    );
  }
}
